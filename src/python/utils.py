#!/usr/bin/env python

from celery import Celery
from celery.task import Task
from CvlCommand import SingleOutputCommand, BackgroundCommand
import cvl_config
from CvlEnvironment import Environment
from novaclient.v1_1 import client
import cvlfabric
import itertools
import logging
import MySQLdb
import novaclient.exceptions
import shlex
import ssh
import time
import traceback
from cvlsql import Cvl_cvl_vm, sql_add_vm, add_user_to_vm, Cvl_users, Cvl_usergroups, Cvl_user_usergroup_map
import smtplib
from email.mime.text import MIMEText
import tempfile
from base64 import b64encode
import os
import sqlobject
import crypt
import datetime
import cvlsql
import enums

celery = Celery('utils', backend='redis://localhost', broker='redis://localhost')

def database_connection():
    return MySQLdb.connect(host = "localhost", user = cvl_config.DATABASE_USER, db = cvl_config.DATABASE_NAME, passwd = cvl_config.DATABASE_PASSWORD)

def send_email(to, subject, body):
    """
    Send an email using localhost's server. The 'from' will appear
    to be cvl_config.CVL_HELP_EMAIL.
    """

    msg = MIMEText(body)

    msg['Subject'] = subject
    msg['From']    = cvl_config.CVL_HELP_EMAIL
    msg['To']      = to

    s = smtplib.SMTP('localhost')
    s.sendmail(cvl_config.CVL_HELP_EMAIL, [to], msg.as_string())
    s.quit()

def run_sql_query(query):
    logging.debug('sql query: ' + query)
    c = database_connection().cursor()
    c.execute(query)
    return c.fetchall()

def run_shell_command(command):
    """
    Run a unix shell command, returning a tuple consisting
    of the: exit code, stdout, stderr. Both stdout and stderr
    are split into lines.

    >>> run_shell_command('echo "hello"')
    (0, ['hello'], [])

    >>> run_shell_command('ls /non_existant_file')
    (2, [], ['ls: cannot access /non_existant_file: No such file or directory'])
    """

    import subprocess as sp

    command = shlex.split(command)

    logging.debug('run_shell_command: ' + str(command))

    proc = sp.Popen(command, stdout=sp.PIPE, stderr=sp.PIPE)
    stdout, stderr = proc.communicate()
    exit_code = proc.wait()

    if stdout is None: stdout = ''
    if stderr is None: stderr = ''

    stdout = stdout.splitlines()
    stderr = stderr.splitlines()

    return (exit_code, stdout, stderr)

def nova_client():
    """
    Returns a Python object for the nova client.

    >>> nc = nova_client()
    >>> print nc.flavors.list()
    [<Flavor: m1.small>, <Flavor: m1.medium>, <Flavor: m1.xlarge>, <Flavor: m1.xxlarge>, <Flavor: m1.large>]
    """

    return client.Client(cvl_config.NOVA_EMAIL_ADDRESS,
                         cvl_config.NOVA_PASSWORD,
                         cvl_config.NOVA_TENANCY,
                         cvl_config.NOVA_URL,
                         service_type="compute")

def is_vm_alive(vm_name):
    """
    Returns True if the given VM is in the ACTIVE state.
    """

    return vm_name in [vm.name for vm in nova_client().servers.list() if vm.status == 'ACTIVE']

def can_ssh_to_server(vm_name, username='root'):
    host = get_vm_info(vm_name)['ip']
    key_filename = cvl_config.VM_KEY_LOCATION + '/' + cvl_config.VM_KEY_NAME

    try:
        client = ssh.SSHClient()
        client.set_missing_host_key_policy(ssh.AutoAddPolicy())
        client.connect(host, username=username, key_filename=key_filename, timeout=10)
        client.close()
        return True
    except:
        return False

def get_vm_info(vm_name):
    """
    For a given VM, return its flavor, ram, nr vcpus and IP address.
    """

    nc = nova_client()

    vm = nc.servers.find(name=vm_name)

    fl_name, fl_ram, fl_vcpus, fl_disk = dict([(f.id, (f.name, f.ram, f.vcpus, f.disk)) for f in nc.flavors.list()])[vm.flavor['id']]

    try:
        vm_ip = map(lambda x: x['addr'], itertools.chain(*(vm.addresses.itervalues())))
        assert len(vm_ip) == 1
        vm_ip = vm_ip[0]
    except:
        vm_ip = None

    return {'id':     vm.id,
            'flavor': fl_name,
            'ram':    fl_ram,
            'disk':   fl_disk,
            'vcpus':  fl_vcpus,
            'ip':     vm_ip,}

def get_nr_available_vcpus():
    """
    Return the number of available VCPUs, or -1 on error.

    Currently the quota functionality in the Python Nova API is
    not implemented, hence the need to run the command line client
    directly.
    """

    return_code, stdout, stderr = run_shell_command('nova absolute-limits')

    if return_code != 0:
        logging.error('error running "nova absolute-limits"')
        return -1

    stdout = dict([(x[1].strip(), x[2].strip()) for x in [y.split('|') for y in stdout if len(y.split('|')) == 4]])

    maxTotalCores  = int(stdout['maxTotalCores'])
    totalCoresUsed = int(stdout['totalCoresUsed'])

    return maxTotalCores - totalCoresUsed


def nova_boot(vm_name, driver, flavor_name):
    """
    Boot a VM given the driver (see cvl_config.VM_IMAGE_ID for a list of
    valid drivers) and flavor (e.g. 'm1.small').

    Example: > x = nova_boot('carlotest1', 0, 'm1.small')
             > print x.id
             5ae5a81e-c3f0-4237-98aa-5c68ac14bcdd

             > print x.addresses
             {}
    """

    nc      = nova_client()
    flavor  = nc.flavors.find(name=flavor_name)
    image   = nc.images.find(id=cvl_config.VM_IMAGE_ID[int(driver)])

    vm = nc.servers.create(vm_name, image, flavor, security_groups=[cvl_config.VM_SECURITY_GROUP], key_name=cvl_config.VM_KEY_NAME)

    return vm

def terminate_vm(vm_hash_id):
    """
    Terminate a vm, using the supplied VM hash id.

    FIXME: check if there are existing user accounts on the VM? We may end up with
    dangling database records?
    """

    vm = utils.nova_client().servers.find(id=vm_hash_id)
    vm.delete()

def get_vm_password_and_key(user_id):
    """
    Given a numerical user id (primary key for the
    DATABASE_VM_USER_TABLE), retrieve the user's Unix password and
    public key.
    """

    result = run_sql_query(query = 'select vm_password, public_key from {vm_user_table} where userid = {user_id}'.format(
                    vm_user_table=cvl_config.DATABASE_VM_USER_TABLE,
                    user_id=user_id))

    assert len(result) == 1

    return (result[0][0],  # password
            result[0][1],) # public key

class CreateCvlVm(Task):
    """
    Boot a VM and perform system administration tasks. This can take
    a long time (over 30 minutes) so it runs as a Celery Task.

    Note: the state is updated with custom metadata (see the
    update_state calls). Refer to dump_work_queue.py for how to
    print this info, which will eventually be integrated into the
    Joomla pages.
    """

    def run(self, vm_name, username, email, cpu, user_id, path, project_group, nectar_id):
            """
            The main task. Everything happens here, from booting the VM, creating user
            accounts, adding database records, and installing the CVL packages.
            """

            params = (vm_name, username, email, cpu, user_id, path, project_group, nectar_id)
            self.email    = email
            self.username = username
            self.vm_name  = vm_name

            self.update_state(state="PROGRESS", meta={'params': params, 'info': 'starting up...',})

            logging.debug('create_cvl_vm: ' + str((vm_name, username, email, cpu, user_id, path, project_group, nectar_id,)))

            driver = 0 # FIXME this should be in cvl_config? Somewhere?
            flavor = nova_client().flavors.find(vcpus=int(cvl_config.VM_CPU[cpu]))

            password, vm_public_key = get_vm_password_and_key(user_id)
            logging.debug("Retrieved user's VM password and public key")

            # We use vm_name as a unique key for the VM, so boot
            # one if a VM with that name doesn't already exist.
            self.update_state(state="PROGRESS", meta={'params': params, 'info': 'checking for existing VM',})
            try:
                vm = nova_client().servers.find(name=vm_name)
                vm_already_exists = True
                # FIXME need to also check if the ip address matches one already in the database
            except novaclient.exceptions.NotFound:
                try:
                    vm = nova_boot(vm_name, driver, flavor.name)
                    vm_already_exists = False
                except:
                    raise ValueError, 'Failed to run nova_boot: %s' % (traceback.format_exc(),)
            self.vm = vm

            if vm_already_exists:
                raise ValueError, 'Attempt to create VM with name <%s> but a VM already exists with that name' % (vm_name,)

            # Wait for the server to get an IP.
            while get_vm_info(vm_name)['ip'] is None:
                logging.debug('VM has no IP, sleeping...')
                time.sleep(1)

            vm_info = get_vm_info(vm_name)
            logging.debug('VM info: ' + str(vm_info))

            vm_ip       = vm_info['ip']
            vm_ram      = vm_info['ram']
            vm_disk     = vm_info['disk']
            vm_id       = vm_info['id']

            self.vm_db = sql_add_vm(driver, vm_name, vm_id, vm_ip, vm_ram, cpu, vm_disk, project_group, nectar_id)
            add_user_to_vm(Cvl_users.select(Cvl_users.q.username==username).getOne(), self.vm_db)

            self.vm_db.state = enums.VmState.Configuration

            # Wait until we can actually ssh into the server.
            self.update_state(state="PROGRESS", meta={'params': params, 'info': 'waiting for SSH connection to VM',})
            while not can_ssh_to_server(vm_name):
                logging.debug("Can't ssh to %s:%s, sleeping..." % (vm_name, vm_ip,))
                time.sleep(1)

            cvlfabric.env.hosts = [vm_ip]

            self.update_state(state="PROGRESS", meta={'params': params, 'info': 'creating user account on VM',})
            logging.debug('Creating user account <%s> on the VM %s' % (username, vm_ip,))

            try:
                cvlfabric.execute(cvlfabric.new_user, username=username, password=password, public_key=vm_public_key)

                self.update_state(state="PROGRESS", meta={'params': params, 'info': 'creating secondary storage on VM',})
                logging.debug('Creating secondary storage on the VM')
                cvlfabric.execute(cvlfabric.create_secondary_storage)

                self.update_state(state="PROGRESS", meta={'params': params, 'info': 'setting VM hostname',})
                logging.debug('Setting VM\'s hostname')
                cvlfabric.execute(cvlfabric.setup_networking, nice_vm_name=vm_name)

                self.update_state(state="PROGRESS", meta={'params': params, 'info': 'installing base CVL system',})
                logging.debug('Installing base CVL system')
                cvlfabric.execute(cvlfabric.install_cvl_base)

                self.update_state(state="PROGRESS", meta={'params': params, 'info': 'installing CVL system (system extension and imaging tools)',})
                logging.debug('Installing CVL system (system extension and imaging tools)')
                cvlfabric.execute(cvlfabric.install_cvl_system)

                self.update_state(state="PROGRESS", meta={'params': params, 'info': 'installing fail2ban',})
                logging.debug('Installing fail2ban')
                cvlfabric.execute(cvlfabric.install_fail2ban)

            except:
               raise ValueError, traceback.format_exc() # avoid SystemExit...

            self.vm_db.state = enums.VmState.Active

            return params

    def on_failure(self, exc, task_id, args, kwargs, einfo):
        """
        If the run() method throws an exception, we drop into this function.
        """

        to      = Cvl_users.select(Cvl_users.q.username==self.username).getOne()
        subject = 'CVL UM: error while creating <%s>' % (self.vm_name,)
        body    = 'task_id: %s\nexception: %s\nargs: %s\nkwargs: %s\neinfo: %s' % (task_id, str(exc), str(args), str(kwargs), str(einfo),)
        send_email(self.email, subject, body)

    def on_success(self, retval, task_id, args, kwargs):
        """
        Let the user know about the created (finished) VM.
        """

        to      = Cvl_users.select(Cvl_users.q.username==self.username).getOne()
        subject = 'CVL UM: successfully created <%s> with IP %s' % (self.vm_name, self.vm_db.vmIp,)
        body    = 'task_id: %s\nretval: %s\nargs: %s\nkwargs: %s\neinfo: %s' % (task_id, str(retval), task_id, str(args), str(kwargs),)
        send_email(self.email, subject, body)


class ChangePasswordsOnVMs(Task):
    """
    Change a user's password on a number of VMs, and reportt
    to the help email address if everything went ok.
    """

    def run(self, vm_name, username, email, password):
        params = (vm_name, username, password)
        logging.debug('changing password for user %s on VM %s' % (username, vm_name,))
        self.vm_name      = vm_name
        self.username     = username
        self.email        = email
        self.password     = password
        self.vm_ip        = get_vm_info(vm_name)['ip']

        cvlfabric.env.hosts = [self.vm_ip]
        cvlfabric.execute(cvlfabric.change_password, username=username, password=password)

    def on_failure(self, exc, task_id, args, kwargs, einfo):
        """
        If the run() method throws an exception, we drop into this function.
        """

        to      = Cvl_users.select(Cvl_users.q.username==self.username).getOne()
        subject = 'CVL UM: failed to change password for user %s on VM <%s>' % (self.username, self.vm_name,)
        body    = 'task_id: %s\nexception: %s\nargs: %s\nkwargs: %s\neinfo: %s' % (task_id, str(exc), str(args), str(kwargs), str(einfo),)
        send_email(self.email, subject, body)

    def on_success(self, retval, task_id, args, kwargs):
        to      = Cvl_users.select(Cvl_users.q.username==self.username).getOne()
        subject = 'CVL UM: successfully changed password for user %s on VM <%s> with IP %s' % (self.username, self.vm_name, self.vm_ip,)
        body    = 'task_id: %s\nretval: %s\nargs: %s\nkwargs: %s\neinfo: %s' % (task_id, str(retval), task_id, str(args), str(kwargs),)
        send_email(self.email, subject, body)


def new_system_user(user_full_name, username, raw_password, joomla_password, access_level, email,
                    project_group, organisation, approved_by, created_by, massive_account, vm_id, vm_ip):
    """
    Create a new user (in Joomla) *and* add them to a given VM.

    FIXME Is there no way to create a user without assigning them to a VM?
    """

    # Create an SSH keypair for the new user.
    temp_dir = tempfile.mkdtemp()

    private_key_filename = username
    public_key_filename  = username + '.pub'

    private_key_path    = os.path.join(temp_dir, private_key_filename)
    public_key_path     = os.path.join(temp_dir, public_key_filename)

    exit_code, stdout, stderr = run_shell_command("ssh-keygen -f {private_key_path} -N ''".format(private_key_path=private_key_path))
   
    private_key = b64encode(open(private_key_path, 'r').read())
    public_key  = b64encode(open(public_key_path,  'r').read())

    os.remove(private_key_path)
    os.remove(public_key_path)

    if access_level == enums.UserAccess.Administrator:
        group_access_id = Cvl_usergroups.select(sqlobject.AND(Cvl_usergroups.q.title=='Administrator', Cvl_usergroups.q.parentID==2)).getOne().id # FIXME magic value 2?
    else:
        group_access_id = Cvl_usergroups.select(sqlobject.AND(Cvl_usergroups.q.title=='User',          Cvl_usergroups.q.parentID==2)).getOne().id # FIXME magic value 2?

    encrypted_unix_password = crypt.crypt(raw_password, 'CvlEncryption')

    driver_id   = 0 # FIXME this is not supported
    activation  = '0'
    send_email   = 0
    register_date = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    logging.debug('Create VM user account .....')

    # FIXME Is OperationState used?
    # FIXME all public and private keys have the same name - this is ok?
    user_record, user_vm_record, user_group_map_record = cvlsql.sql_add_user(user_full_name, username, joomla_password, email, enums.OperationState.Idle,
                                                                             public_key, cvl_config.PUBLIC_KEY_NAME, private_key, cvl_config.PRIVATE_KEY_NAME,
                                                                             massive_account, project_group, group_access_id, approved_by, created_by,
                                                                             driver_id, activation, send_email, register_date, organisation, encrypted_unix_password)



    # FIXME This ought to be a celery task, otherwise a dead VM will stop the process?
    cvlfabric.env.hosts = [vm_ip]
    cvlfabric.execute(cvlfabric.new_user, username=username, password=encrypted_unix_password, public_key=public_key)

    cvlsql.add_user_to_vm(user_record, Cvl_cvl_vm.select(Cvl_cvl_vm.q.vmIp==vm_ip).getOne())

    return user_record.id

def delete_system_user(user_id, username):
    """
    Delete a system user from Joomla and also delete all accounts on all VMs.

    FIXME: Delete users in a celery task? What do we do if the user can't be deleted, the VM is off, etc????
    """

    user_db = Cvl_users.select(Cvl_users.q.id==user_id).getOne()

    # For each VM that the user is a member of:
    for vm_id, vm_ip, vm_name in cvlsql.get_users_vms(user_id):
        # Delete the user's account on the VM.
        try:
            cvlfabric.env.hosts = [vm_ip]
            cvlfabric.execute(cvlfabric.delete_user, username=username, warn_only=True)
        except:
            logging.error('Could not delete user %s from VM %s' % (username, vm_ip,))

        # Remove the mapping from the user to the VM.
        cvlsql.delete_user_from_vm(user_id, vm_id)

    # Remove the user's user_group mapping:
    Cvl_user_usergroup_map.delete(Cvl_user_usergroup_map.select(Cvl_user_usergroup_map.q.id==user_id).getOne().id)

    # Remove the user record.
    Cvl_users.delete(user_id)
