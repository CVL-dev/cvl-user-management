#!/usr/bin/python

import json
import sys, time, traceback
from base64 import b64encode

from CvlSql import FetchData, Authentication, GetPrivateKey, GetUserData
import logging

class ClientQuery:
    def __init__(self, message):
        self.message = {} 
        self.message = message 
        self.result = False 
        self.response = {}
        self.ipList = []
        self.vmNameList = []
        self.username = ""
        logging.debug(self.message)

    def getResponse(self):
        return json.dumps(self.response)

    def query(self):
        return self.localResponse()

    def localResponse(self):
        self.result = False 
        return self.Response()

    def Response(self):
        request = json.loads(self.message)
       
        if "username" in request:
            self.username = request["username"]
        else:
            self.response["error"] = "Missing username"
            logging.error("Missing username")
            return False

        if "request_user_data" in request:
            self.ResponseUserData()
        
        if "request_private_key" in request:
            self.ResponsePrivateKey()

        self.result = True 
        return True

    def ResponsePrivateKey(self):
        user = GetPrivateKey(self.username)
        if user.check() == False:
            logging.error("Invalid user")
            self.response["error"] = "username " + self.username + " failed get data"
            return False
        hashKey = user.getKey()
        self.response["private_key_name"] = "cvl_massive_key"
        self.response["private_key"] = hashKey
        logging.debug("Done key")
        return True

    def ResponseUserData(self):
        user = GetUserData(self.username)
        if user.fetch() == False:
            self.response["error"] = "username " + self.username + " failed to get data"
            logging.error("Failed get user data")
            return False
        self.response["massive_account"] = user.getMassiveAccount()
        ipList = user.getVmIp()
        vmNameList = user.getVmName()
        for ip in ipList:
            self.ipList.append(ip)
        for name in vmNameList:
            self.vmNameList.append(name)
        ipListLength = len(self.ipList)
        vmNameListLength = len(self.vmNameList)
        logging.debug("Name length: " + str(vmNameListLength))
        if ipListLength > 0:
            self.response["vm_ip"] = self.ipList
        if vmNameListLength > 0:
            self.response["vm_name"] = self.vmNameList

        logging.debug("Done user data")
        return True


message = "" 
if len(sys.argv) < 2:
    logging.error("Cvl client miss parameters")
else:
    message = sys.argv[1]

 
client = ClientQuery(message)

if client.query() == True:
    response = client.getResponse()
    logging.debug("Query passed, response size: " + str(len(response)))
    logging.debug("Query passed, response = " + str(response))
    print response 

else:
    logging.error("Failed query")
    sys.exit(1)
