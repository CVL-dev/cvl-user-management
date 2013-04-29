import cvl_config
from fabric.api import run, roles, env, execute, put
import utils

env.hosts                   = []
env.user                    = 'root'
env.key_filename            = cvl_config.VM_KEY_LOCATION + '/' + cvl_config.VM_KEY_NAME
env.disable_known_hosts     = True

import fabric.state

fabric.state.output['aborts']       = False
#fabric.state.output['debug']        = False
fabric.state.output['running']      = False
fabric.state.output['status']       = False
fabric.state.output['stderr']       = False
fabric.state.output['stdout']       = False
fabric.state.output['user']         = False
fabric.state.output['warnings']     = False


def new_user(**kwargs):
    """
    Creates a new user and adds them to a group with sudo privileges.

    Modified from: http://codebetter.com/brendantompkins/2011/02/07/ubuntu-server-setup-with-python-fabric/
    """

    username   = kwargs['username']
    password   = kwargs['password']
    public_key = kwargs['public_key']

    if not run('id --user {username}'.format(username=username), warn_only=True).failed:
        # user already exists!
        return

    # Create the admin group and add it to the sudoers file.
    group = 'admin'
    run('groupadd {group}'.format(group=group), warn_only=True, quiet=True)
    run('echo "%{group} ALL=(ALL) ALL" >> /etc/sudoers'.format(group=group), quiet=True) # FIXME check if this line is already present?

    # Create the new user (default group=username); add to specified group.
    run('adduser {username}'.format(username=username))
    run('usermod -a -G {group} {username}'.format(username=username, group=group))

    # Set the password for the new admin user.
    run('echo "{username}:{password}" | chpasswd -e'.format(username=username, password=password))

    # Add the public key
    run('mkdir /home/{username}/.ssh'.format(username=username), warn_only=True)
    run('touch /home/{username}/.ssh/authorized_keys'.format(username=username))
    run('echo {public_key} | base64 -d >> /home/{username}/.ssh/authorized_keys'.format(public_key=public_key, username=username))
    run('chown -R {username}:{username} /home/{username}/.ssh'.format(username=username))
    run('chmod 700 /home/{username}/.ssh'.format(username=username))
    run('chmod 600 /home/{username}/.ssh/authorized_keys'.format(username=username))

def delete_user(**kwargs):
    """
    Delete a user and remove their home directory.

    FIXME: Will this fail if there are mounted directories in the home directory?

    FIXME: this DOES fail if the user is logged in, because we don't use "userdel -f -r ...".
    FIXME: should we forcibly log out a user and delete their account?
    """

    username = kwargs['username']
    run('userdel -r {username}'.format(username=username))

def change_password(**kwargs):
    """
    Change a user's Unix password.
    """

    username   = kwargs['username']
    password   = kwargs['password']

    run('echo "{username}:{password}" | chpasswd -e'.format(username=username, password=password), quiet=True)

def create_secondary_storage():
    """
    Nectar VMs have a secondary storage partition /dev/vdb. Use fdisk
    to create the partition and then format it, storing /usr/local on the
    new partition. Also add it to /etc/fstab for auto-mount on boot.

    FIXME The latest Centos 6.4 image boots with the secondary storage
    automatically mounted under /mnt, so this step will be unncessary.
    """

    run("echo 'n\np\n1\n\n\nw\n' | fdisk -u /dev/vdb")
    run("mkfs.ext4 /dev/vdb1")

    run("mv /usr/local /usr/local.original")
    run("echo '/dev/vdb1               /usr/local              ext4    defaults        1 2' >> /etc/fstab")
    run("mkdir /usr/local")
    run("mount /dev/vdb1")
    run(r"find /usr/local.original -maxdepth 1 -mindepth 1 -exec mv {} /usr/local/ \;")
    run("rm -fr /usr/local.original")

def setup_networking(**kwargs):
    """
    Set the VM's hostname to the user-supplied "nice" name, with spaces
    changed to dashes.
    """

    nice_vm_name = kwargs['nice_vm_name']
    hostname = nice_vm_name.replace(' ', '-')

    run('hostname ' + hostname)
    run('echo "NETWORKING=yes" > /etc/sysconfig/network')
    run('echo "HOSTNAME={hostname}" >> /etc/sysconfig/network'.format(hostname=hostname))

def install_cvl_base():
    """
    Use yum to install the base CVL packages.
    """

    run('wget -q http://cvlrepo.massive.org.au/repo/cvl.repo -O /etc/yum.repos.d/cvl.repo')

    run('yum clean all')
    run('yum clean all')
    run('yum -y groupinstall "CVL Base Packages"')

def install_cvl_system():
    """
    Use yum to install the CVL system, including general imaging tools.
    """

    run('yum -y groupinstall "CVL System"')
    run('yum -y groupinstall "CVL System Extension"')
    run('yum -y groupinstall "CVL General Imaging Tools"')

    # Add some nicer fonts
    run('yum -y groupinstall "Fonts"')

def install_fail2ban():
    run('yum -y install fail2ban')
    put('jail.local', '/etc/fail2ban/jail.local', use_sudo=True)
    run('chkconfig fail2ban on')
    run('sudo service fail2ban restart')

if __name__ == '__main__':
    # For testing, one can run a task like this:
    # execute(foobar, username='carlo000')
    pass
