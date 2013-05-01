#!/usr/bin/python

import time, os, datetime
import traceback
import cvl_config
from CvlEnvironment import Environment

import logging
import utils
import cvlfabric
import cvlsql
import crypt
import enums

from cvlsql import Cvl_cvl_vm_user, Cvl_users

class RunCommand:
    def __init__(self, action, driver, userDays, userId, username, password, serverId, path, cpu, vmDbId, serverIp, serverName, email, userFullName, organisation, createdBy, approvedBy, accessLevel, projectGroup, massiveAccount, cryptedPassword, nectarId):
        self.action = int(action)
        self.cpu = int(cpu)
        self.nectarId = nectarId
        self.driver = driver
        self.userDays = userDays
        self.username = username.strip()
        self.userFullName = userFullName
        self.organisation = organisation
        self.createdBy = createdBy
        self.userId = userId
        self.vmDbId = vmDbId
        self.password = password
        self.cryptedPassword = cryptedPassword
        self.path = path
        self.email = email
        self.approvedBy = approvedBy
        self.accessLevel = int(accessLevel)
        self.projectGroup = int(projectGroup)
        self.massiveAccount = massiveAccount
        self.serverId = serverId
        self.serverIp = serverIp
        self.serverName = serverName
        self.vmAccountId = 0
        self.result = False
        self.administratorGroupId = 0
        self.userGroupId = 0

        logging.debug("Run command, action = " + str(self.action))

    def run(self):
        # open('/tmp/debug.txt', 'w').write(str(self.action) + '\n'); return True

        try:
            assert Environment.checkOrSet()
            if self.action == enums.Action.CreateServer:
                self.result = self.CreateServer()            

            elif self.action == enums.Action.JoinServer:
                self.result = self.JoinServer()

            elif self.action == enums.Action.DeleteServer:
                self.result = self.DeleteServer()

            elif self.action == enums.Action.ChangePassword:
                self.result = self.ChangePassword()
            
            elif self.action == enums.Action.CreateVmUserAccount:
                self.result = self.CreateVmUserAccount()
            
            elif self.action == enums.Action.DeleteVmUserAccount:
                logging.debug("Delete VM user account")
                self.result = self.DeleteVmUserAccount()

            elif self.action == enums.Action.TerminateServer:
                logging.debug("Terminate VM instance")
                self.result = self.TerminateServer()

            elif self.action == enums.Action.AddServer:
                logging.debug("AddServer")
                self.result = self.AddServer()

            else:
                logging.error("Unsupported action: " + self.action)
                return False
            
        except:
            logging.error("Exeption: " + traceback.format_exc())                 
        finally:
            return self.result 

    def CreateVmUserAccount(self):
        new_user_id = utils.new_system_user(self.userFullName, self.username, self.password, self.cryptedPassword, self.accessLevel, self.email, 
                                            self.projectGroup, self.organisation, self.approvedBy, self.createdBy, self.massiveAccount, self.vmDbId, self.serverIp)

        return new_user_id is not None

    def DeleteVmUserAccount(self):
        # FIXME This does not delete a vm user account, it deletes
        # a system account!
        utils.delete_system_user(self.userId, self.username)
        return True

    def CreateServer(self):
        try:
            from utils import CreateCvlVm
            job = CreateCvlVm.delay(self.serverName, self.username, self.email, self.cpu, self.userId, self.path, self.projectGroup, self.nectarId)
            logging.debug('CreateServer: celery job: ' + str(job))
            utils.send_email(cvl_config.CVL_HELP_EMAIL,
                             "CVL project: notification of VM build",
                             "Building new VM: " + str((self.serverName, self.username, self.email, self.cpu, self.userId, self.path, self.projectGroup, self.nectarId)) + ' in tenancy ' + utils.nova_client().project_id + '\ncelery job id: ' + str(job))
        except:
            logging.error('Could not create VM: %s' % (traceback.format_exc(),))
            print 'Error while creating VM "%s"' % (self.serverName,)
            return False

        print 'Creation of VM "%s" is in progress with job id %s. A status email has been sent to %s.' % (self.serverName, job, self.email,)
        return True

    def DeleteServer(self): # FIXME perhaps this should be "DeleteUserFromServer"? What's the deal with DeleteVmUserAccount???
        logging.debug('Deleting user account <%s> on the VM %s' % (self.username, self.serverIp,))

        try:
            cvlfabric.env.hosts = [self.serverIp]
            cvlfabric.execute(cvlfabric.delete_user, username=self.username)
        except:
            logging.error('Could not remove user %s from vm %s: %s' % (self.username, self.serverIp, traceback.format_exc()))
            print 'Could not remove the user %s from the vm %s. Please check if the user is currently logged in.' % (self.username, self.serverIp,)
            return False
 
        try:
            logging.debug('Removing VM user map for user_id = %s to vm_id %s' % (self.userId, self.vmDbId))
            cvlsql.delete_user_from_vm(self.userId, self.vmDbId)
        except:
            logging.error('Error removing user with id %s from vm with id %s.' % (self.userId, self.vmDbId,))
            return False
 
        print 'Deleted user %s from the vm %s.' % (self.username, self.serverIp,)
        return True

    def TerminateServer(self):
        try:
            logging.debug('Terminating VM %s with IP %s' % (self.vmDbId, self.serverIp,))
            vm = utils.nova_client().servers.find(id=self.serverId)
            vm.delete()
        except:
            logging.error('Error while terminating VM %s with IP %s: %s' % (self.vmDbId, self.serverIp, traceback.format_exc()))
            print 'Error while terminating VM %s with IP %s' % (self.vmDbId, self.serverIp,)
            return False

        try:
            logging.debug('Removing VM %s from the database' % (self.vmDbId,))
            cvlsql.delete_vm(self.serverIp)
        except:
            logging.error('Error while removing VM %s from the database: %s' % (self.serverIp, traceback.format_exc()))
            print 'Error while removing VM %s from the database' % (self.serverIp,)

        print 'Terminated VM %s' % (self.serverIp,)
        return True

    def ChangePassword(self):
        new_unix_password = crypt.crypt(self.password, "CvlEncryption")

        # At this point:
        # self.password         = new plain text password that the user entered
        # self.cryptedPassword  = new joomla password
        # new_unix_password     = new Unix password, encrypted

        for (vm_id, vm_ip, vm_name) in cvlsql.get_users_vms(self.userId):
            job = utils.ChangePasswordsOnVMs.delay(vm_name, self.username, Cvl_users.select(Cvl_users.q.id==self.userId).getOne().email, new_unix_password)

        # Update Joomla password:
        Cvl_users.select(Cvl_users.q.id==self.userId).getOne().password = self.cryptedPassword
 
        # Update stored Unix VM password:
        Cvl_cvl_vm_user.select(Cvl_cvl_vm_user.q.id==self.userId).getOne().vmPassword = new_unix_password
 
        return True

    def UpdateServer(self):
        logging.error("Updateserver is not supported yet ...")
        return False

    def JoinServer(self):
        user_db    = Cvl_users.select(Cvl_users.q.id==self.userId).getOne()
        user_vm_db = Cvl_cvl_vm_user.select(Cvl_cvl_vm_user.q.id==self.userId).getOne()
        vm_db      = cvlsql.sql_get_vm(self.serverIp)

        cvlfabric.env.hosts = [self.serverIp]
        cvlfabric.execute(cvlfabric.new_user, username=user_db.username, password=user_vm_db.vmPassword, public_key=user_vm_db.publicKey)

        cvlsql.add_user_to_vm(user_db, vm_db)

        return True
 
    def AddServer(self):
        #from CvlAddVm import AddVm
        #process = AddVm(self.path, self.userId, self.serverName, self.nectarId)
        #if process.run() == False:
        #    logging.error("Failed to add VM " + self.serverName)
        #    return False
        #return True

        logging.debug('AddServer: ' + str((self.userId, self.serverName, self.nectarId,)))

        try:
            vm_name = self.serverName

            vm_info = utils.get_vm_info(vm_name)
            logging.debug('vm_info: ' + str(vm_info))

            vm_ip       = vm_info['ip']
            vm_ram      = vm_info['ram']
            vm_disk     = vm_info['disk']
            vm_id       = vm_info['id']
            vm_vcpus    = vm_info['vcpus']

            vm_db = cvlsql.sql_add_vm(0, vm_name, vm_id, vm_ip, vm_ram, vm_vcpus, vm_disk, self.projectGroup, self.nectarId)

            logging.debug('Added vm to database: ' + str(vm_db))

            user_db    = Cvl_users.select(Cvl_users.q.id==self.userId).getOne()
            user_vm_db = Cvl_cvl_vm_user.select(Cvl_cvl_vm_user.q.id==self.userId).getOne()

            logging.debug('username: ' + user_db.username)

            cvlsql.add_user_to_vm(Cvl_users.select(Cvl_users.q.id==self.userId).getOne(), vm_db)
            vm_db.state = enums.VmState.Active

            vm_db      = cvlsql.sql_get_vm(vm_ip)

            logging.debug('creating user account <%s> on vm %s' % (user_db.username, vm_ip,))

            cvlfabric.env.hosts = [vm_ip]
            cvlfabric.execute(cvlfabric.new_user, username=user_db.username, password=user_vm_db.vmPassword, public_key=user_vm_db.publicKey)
            cvlsql.add_user_to_vm(user_db, vm_db)

            return True
        except:
            logging.debug('error adding unmanaged VM to system: ' + traceback.format_exc())
            return False
