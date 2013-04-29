#!/usr/bin/python


import MySQLdb, re, sys
import traceback 

import cvl_config
from enums import VmState
import logging

def DatabaseConnection():
    try:
        return MySQLdb.connect(host = "localhost", user = cvl_config.DATABASE_USER, db = cvl_config.DATABASE_NAME, passwd = cvl_config.DATABASE_PASSWORD)
    except:
        logging.error("Exception: failed to update VM database" + traceback.format_exc())
        sys.exit(1)

class AddUserVmMap:
    def __init__(self, userId, vmId):
        self.userId = userId
        self.vmId = vmId 
        self.result = False
        self.db = DatabaseConnection() 

    def addMap(self):
        try:
            cursor = self.db.cursor()
            sql = "insert into " + cvl_config.DATABASE_VM_LIST + " (userid, vmid) VALUES (" + str(self.userId) + ", " + str(self.vmId) + ")"
            cursor.execute(sql)
            self.db.commit()
            self.result = True
            logging.debug("Update VM list OK")
        except:
            logging.error("Exception: " + traceback.format_exc())
            self.db.rollback()
        finally: 
            self.db.close()
            return self.result 

class AddVm:

    def __init__(self, driver, name, serverId, ip, ram, cpu, disk, userId, projectGroup, nectarId, state = VmState.Configuration):
        self.name = name
        self.serverId = serverId 
        self.ip = ip
        self.ram = ram
        self.cpu = cpu
        self.disk = disk
        self.driver = driver
        self.userId = userId
        self.projectGroup = str(projectGroup)
        self.nectarId = nectarId
        self.result = False
        self.message = "AddVm: "
        self.columnId = 0
        self.state = state
        self.db = DatabaseConnection() 

    def getAccountId(self):
        return self.columnId

    def update(self):
        try:
            cursor = self.db.cursor()

            # First check if the IP address has already in database
            sql = "select id from " + cvl_config.DATABASE_VM_TABLE + " where vm_ip = \'" + self.ip + "\'"
            cursor.execute(sql)
#            self.db.commit()
            if cursor.rowcount > 0:
                logging.debug("IP " + self.ip + " exists")
                fetchOne = cursor.fetchone()
            	self.columnId = fetchOne[0] 
            else:     
                logging.debug("Add " + self.ip + " to database")

                sql = "insert into " + cvl_config.DATABASE_VM_TABLE + " (state, driver_id, vm_id, vm_server_name, vm_ip, vm_ram_size, vm_cpu_number, vm_disk_size, project_group, provider_id) values (" + str(self.state) + ", " + str(self.driver) + ", \'" + self.serverId + "\', \'" + self.name + "\', \'" + self.ip + "\', " + self.ram + ", " + self.cpu + ", " + self.disk + ", " + self.projectGroup + ", " + str(self.nectarId) + ")"
                cursor.execute(sql)
                self.db.commit()
            
                # Get column ID
                sql = "select id from " + cvl_config.DATABASE_VM_TABLE + " where vm_id = \'" + self.serverId + "\'"
                cursor.execute(sql)
                self.db.commit()
                if cursor.rowcount == 0:
                    logging.error("Failed to insert VM database")
                    return False

                fetchOne = cursor.fetchone()
                self.columnId = fetchOne[0] 

                logging.debug("Add VM to " + str(self.columnId))

                # Add vm user map
                sql = "insert into " + cvl_config.DATABASE_VM_LIST  + " (userid, vmid) values (" + str(self.userId) + ", " + str(self.columnId) + ")"
                logging.debug(sql)
#                cursor.close()
#                cursor = self.db.cursor()
                cursor.execute(sql)
                self.db.commit()
                logging.debug("User account ID: " + str(self.columnId))
            cursor.close()
            self.result = True
        except:
            self.message += "Exception: " + traceback.format_exc()
            self.db.rollback()
        finally: 
            self.db.close()
            logging.debug(self.message)
            return self.result 


class FetchData:

    def __init__(self, table, column, where):
        self.table = table 
        self.column = column 
        self.where = where 
        self.db = DatabaseConnection() 
        self.result = False
        self.count = 0
        self.rows = []

    def findData(self):
        return self.count > 0 

    def getRow(self):
        return self.rows

    def fetch(self):
        try:
            cursor = self.db.cursor()
            numberColumn = len(self.column)

            sql = "select "
            tag = ", "
            for i in range(numberColumn):
                if i == numberColumn - 1:
                    tag = " "
                sql += self.column[i] + tag
            sql += " from " + self.table
            if self.where != "":
                sql += " " + self.where

            cursor.execute(sql)
            self.count = cursor.rowcount
            logging.debug("Fetch rows: " + str(self.count))

            if self.count > 0:
                self.rows = cursor.fetchall()
                self.result = True
        except:
            logging.error("Exception: " + traceback.format_exc())
            self.db.rollback()
        finally: 
            self.db.close()
            return self.result 

    
class FetchRowByQuery:

    def __init__(self, query):
        self.query = query
        self.result = True
        self.db = DatabaseConnection() 

    def getNumberRow(self):
        return self.count

    def getRow(self):
        return self.rows

    def fetch(self):
        try:
            cursor = self.db.cursor()
            cursor.execute(self.query)
            self.count = cursor.rowcount
            self.rows = cursor.fetchall()
        except:
            logging.error("Exception" + traceback.format_exc())
            self.result = False
        finally:
            self.db.close()
            return self.result

class VmMap:
    def __init__(self, userId, projectGroup, vmData, nectarId):
        self.userId = userId 
        self.projectGroup = projectGroup
        self.vmData = vmData 
        self.nectarId = nectarId
        self.result = True
        self.db = DatabaseConnection() 
        self.vmId = 0
        self.numberRow = 0

    def getVmId(self):
        return self.vmId

    def searchOrSet(self):
        if self.searchOrSetVmTable() == False:
            return False
        if self.searchOrSetVmMap(self.vmId) == False:
            return False
        return True

    def searchOrSetVmMap(self, vmId):
        query = "select vmid from " + cvl_config.DATABASE_VM_LIST + " where userid = " + str(self.userId) + " and vmid = " + str(vmId)
        vm = FetchRowByQuery(query)
        if vm.fetch() == False:
            return False
        numberRow = vm.getNumberRow()
        if numberRow == 0:
            vmMap = AddVmList(self.userId, vmId)
            if vmMap.update() == False:
                return False
        return True

    def searchOrSetVmTable(self):
        result = False
        try:
            query = "select id from " + cvl_config.DATABASE_VM_TABLE + " where vm_id = \"" + self.vmData.serverId + "\""
            vm = FetchRowByQuery(query)
            if vm.fetch() == False:
                logging.error("Failed to run fetch vm data")
                return False
            self.numberRow = vm.getNumberRow()

            logging.debug("VM row: " + str(self.numberRow))

            if self.numberRow > 0:
                rows = vm.getRow()
                self.vmId = rows[0][0]
                logging.debug("Find vmId = " + str(self.vmId))
            else:
                logging.debug("Add VM table: " + self.vmData.serverName)

                logging.debug("state: " + str(VmState.state[self.vmData.status]))
                record = AddVm(0, self.vmData.serverName, self.vmData.serverId, self.vmData.ip, self.vmData.ram, self.vmData.cpu, self.vmData.disk, self.userId, self.projectGroup, self.nectarId, VmState.state[self.vmData.status])
                if record.update() == False:
                    logging.error("Failed to set VM record")
                    return False
                self.vmId = record.getAccountId()
                logging.debug("Search or set vmId = " + str(self.vmId))
            result = True
        except:
            logging.error("Exception " + traceback.format_exc()) 
        finally:
            return result

class Authentication:
    def __init__(self, username, password):
        self.username = username 
        self.password = password 
        self.result = False

    def check(self):
        try:
            self.result = True 
        except:
            logging.error("Exception " + traceback.format_exc()) 
        finally:
            return self.result

class GetPrivateKey:
    def __init__(self, username):
        self.username = username 
        self.key = ""
        self.result = False

    def getKey(self):
        return self.key

    def check(self):
        try:
            # Check username if it contains "" or not 
            matche = re.findall(r'\"(.+?)\"', self.username)            
            if not matche:
                self.username = "\"" + self.username + "\""    
            # self.username has already contained ""
            query = "select a.private_key from " + cvl_config.DATABASE_VM_USER_TABLE + " as a inner join " + cvl_config.DATABASE_USER_TABLE + " as b on a.userid = b.id where b.username = " + self.username
            user = FetchRowByQuery(query)
            if user.fetch() == False:
                logging.error("Failed fetch user data")
                return False
            numberRow = user.getNumberRow()
            if numberRow == 0:
                logging.error("Fetch user invalid")
                return False
            rows = user.getRow()
            self.key = rows[0][0]
            self.result = True 
        except:
            logging.error("Exception " + traceback.format_exc()) 
        finally:
            return self.result

class GetUserData:
    def __init__(self, username):
        self.username = username 
        self.ip = [] 
        self.name = [] 
        self.massiveAccount = ""
        self.result = False

    def getVmIp(self):
        return self.ip

    def getMassiveAccount(self):
        return self.massiveAccount

    def getVmName(self):
        return self.name

    def fetch(self):
        try:
            # Check username if it contains "" or not 
            matche = re.findall(r'\"(.+?)\"', self.username)            
            if not matche:
                self.username = "\"" + self.username + "\""    
                
            # The username string contains "" already
            query = "select a.userid, a.massive_account from " + cvl_config.DATABASE_VM_USER_TABLE + " as a inner join " + cvl_config.DATABASE_USER_TABLE + " as b on a.userid = b.id where b.username = " + self.username
            user = FetchRowByQuery(query)
            if user.fetch() == False:
                logging.error("Failed fetch user data")
                return False
            numberRow = user.getNumberRow()
            if numberRow == 0:
                logging.error("Fetch user invalid")
                return False
            rows = user.getRow()
            userId = rows[0][0]
            self.massiveAccount = rows[0][1]

            query = "select a.vm_ip, a.vm_server_name from " + cvl_config.DATABASE_VM_TABLE + " as a inner join " + cvl_config.DATABASE_VM_LIST + " as b on a.id = b.vmid where b.userid = " + str(userId)
            user = FetchRowByQuery(query)
            if user.fetch() == False:
                logging.error("Failed fetch VM data")
                return False
            numberRow = user.getNumberRow()
            if numberRow == 0:
                logging.error("Fetch VM invalid")
                return False
            rows = user.getRow()
            for row in rows:
                self.ip.append(row[0])
                self.name.append(row[1])

            self.result = True 
        except:
            logging.error("Exception " + traceback.format_exc()) 
        finally:
            return self.result



