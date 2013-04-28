import sqlobject
from sqlobject.sqlbuilder import Insert, Delete, Select
import cvl_config
import datetime

sqlobject.sqlhub.processConnection = sqlobject.connectionForURI('mysql://' + cvl_config.DATABASE_USER + ':'
                                                                + cvl_config.DATABASE_PASSWORD + '@localhost:3306/'
                                                                + cvl_config.DATABASE_NAME)

class Cvl_users(sqlobject.SQLObject):
    class sqlmeta:
        fromDatabase = True
        table = 'Cvl_users'

    _connection = sqlobject.sqlhub.processConnection

class Cvl_cvl_vm_user(sqlobject.SQLObject):
    class sqlmeta:
        fromDatabase = True
        table = 'Cvl_cvl_vm_user'
        idName = 'userid'
    _connection = sqlobject.sqlhub.processConnection

class Cvl_cvl_vm(sqlobject.SQLObject):
    class sqlmeta:
        fromDatabase = True
        table = 'Cvl_cvl_vm'

    _connection = sqlobject.sqlhub.processConnection

    # FIXME Is checkedOutTime a DATETIME or a string? Have to force it
    # to be a StringCol otherwise we get type errors. Also it doesn't seem to
    # be used anywhere. Or is it a Joomla field?
    checkedOutTime = sqlobject.StringCol(length=255)

class Cvl_usergroups(sqlobject.SQLObject):
    class sqlmeta:
        fromDatabase = True
        table = 'Cvl_usergroups'
    _connection = sqlobject.sqlhub.processConnection

class Cvl_user_usergroup_map(sqlobject.SQLObject):
    class sqlmeta:
        fromDatabase = True
        table = 'Cvl_user_usergroup_map'
        idName = 'user_id'
    _connection = sqlobject.sqlhub.processConnection

def sql_add_vm(driver, vm_name, vm_id, vm_ip, vm_ram, cpu, vm_disk, project_group, nectar_id):
    """
    Wrapper for adding a VM record.

    FIXME: Can the defaults, e.g. ordering=0, be pushed up into the class definition?
    """

    assert vm_ip != ''

    # FIXME Issues with multiple VMs with the same name/IP... what are the business rules?

    return Cvl_cvl_vm(checkedOutTime='0000-00-00 00:00:00',   # FIXME what is this field?
                      ordering=0,                             # FIXME what is this field?
                      driverID=driver,
                      checkedOut=0,                           # FIXME what is this field?
                      createdBy=0,                            # FIXME what is this field?
                      vmID=vm_id,
                      vmCpuNumber=cpu,
                      vmIp=vm_ip,
                      vmRamSize=vm_ram,
                      vmServerName=vm_name,
                      vmDiskSize=vm_disk,
                      projectGroup=project_group,
                      providerID=nectar_id,
                     )

def add_user_to_vm(user, vm):
    """
    Add a record to Cvl_cvl_server_list indicating that this user has an account
    on the specified vm.

    user: Cvl_users database object
    vm:   Cvl_cvl_vm database object
    """

    conn = sqlobject.sqlhub.processConnection
    conn.query(conn.sqlrepr(Insert('Cvl_cvl_server_list', values={'userid': user.id, 'vmid': vm.id})))

def get_users_vms(user_id):
    """
    Return a list of vm ids for which the user is a member of.
    """
    
    result = []

    conn = sqlobject.sqlhub.processConnection
    for vm_id in conn.queryAll(conn.sqlrepr(Select(['vmid'], staticTables=['Cvl_cvl_server_list'], where='userid=' + str(user_id)))):
        result += conn.queryAll(conn.sqlrepr(Select(['id', 'vm_ip', 'vm_server_name'], staticTables=['Cvl_cvl_vm'], where='id = ' + str(vm_id[0]))))

    return result

def delete_user_from_vm(userid, vmid):
    """
    Delete the record in Cvl_cvl_server_list for the (user, vm) pair.

    userid: numerical id, primary key of Cvl_users.
    vmid:   numerical id, primary key of Cvl_cvl_vm.
    """

    conn = sqlobject.sqlhub.processConnection
    conn.query(conn.sqlrepr(Delete('Cvl_cvl_server_list', where='userid={userid} and vmid={vmid}'.format(userid=userid, vmid=vmid))))

def delete_vm(vm_ip):
    """
    Delete a vm, given the IP address.
    
    FIXME What is meant to be unique for a VM? Name? IP (yes)? hash-id? Do we allow multiple VMs with the same names?
    """

    Cvl_cvl_vm.delete(Cvl_cvl_vm.select(Cvl_cvl_vm.q.vmIp==vm_ip).getOne().id)

def sql_get_vm(vm_ip):
    """
    Get the VM record for a given IP.
    """

    return Cvl_cvl_vm.select(Cvl_cvl_vm.q.vmIp==vm_ip).getOne()

def sql_add_user(name, username, password, email, state, publicKey, publicKeyName, privateKey, privateKeyName,
                 massiveAccount, projectGroup, accessGroupId, approvedBy, createdBy, driverId, activation, sendEmail,
                 registerDate, organisation, vmPassword):
    """
    Add a user to the user management system. Namely, we update Cvl_users and Cvl_user_usergroup_map.
    """

    if Cvl_users.select(Cvl_users.q.username==username).count() != 0:
        raise ValueError, 'User <%s> already exists in Cvl_users' % (username,)

    user_record = Cvl_users(name=name,
                            username=username,
                            email=email,
                            password=password,
                            sendEmail=sendEmail,
                            registerDate=datetime.datetime.now(),
                            activation=activation,
                            lastvisitDate=datetime.datetime.now(),
                            lastResetTime=datetime.datetime.now(),
                            params='', # FIXME unused?
                           )

    user_vm_record = Cvl_cvl_vm_user(id=user_record.id,
                                     state=state,
                                     createdBy=createdBy,
                                     approvedBy=approvedBy,
                                     publicKey=publicKey,
                                     privateKey=privateKey,
                                     privateKeyName=privateKeyName,
                                     massiveAccount=massiveAccount,
                                     projectGroup=projectGroup,
                                    )

    user_group_map_record = Cvl_user_usergroup_map(id=user_record.id,
                                                   groupID=accessGroupId,
                                                  )

    return user_record, user_vm_record, user_group_map_record
