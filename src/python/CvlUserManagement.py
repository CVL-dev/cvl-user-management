#!/usr/bin/python


import sys, getopt
import logging

from CvlCommandHandler import RunCommand

def Usage():
    logging.debug("Usage: CvlUserManagement.py --action <vm_action> --driver <vm_driver> --days <vm_use_days> --user_id <user_account_ID> --email <email address> --path <path> --server_id <VM instance ID> --username <username> --userfullname <User full name> --access_level <User access level> --project_group <Project group> --organization <Organization> --createdby <User account created by> --approvedby <User account approved by> --cpu <number of cpus> --password <password> --crypted_password <Encrypted Joomla account password> --massive_account <Massive account user name> --vm_db_id <VM database ID> --server_ip <VM instance IP> --server_name <VM instance name> --nectar_id <NeCTAR service provider ID>")
    logging.debug("Usage: CvlUserManagement.py --help")
    sys.exit(0)
    
def main(argv):
    username = "" 
    password = "" 
    vmAction = 0
    vmDriver = 0 
    useDays = 0 
    userId = 0
    email = ""
    vmDbId = 0
    serverId = ""
    serverIp = ""
    serverName = ""
    path = ""
    cpu = 0 
    userFullName = ""
    organization = ""
    accountCreatedBy = ""
    accountApprovedBy = ""
    userAccessLevel = 0
    projectGroup = 0 
    massiveAccount = ""
    cryptedPassword = ""
    nectarId = 0

    logging.debug("Start user management")

    try:
        opts, args = getopt.getopt(argv, "",["help", "action=", "path=", "driver=", "days=", "user_id=", "email=", "server_id=", "server_ip=", "server_name=", "username=", "userfullname=", "project_group=", "access_level=", "organization=", "createdby=", "approvedby=", "cpu=", "massive_account=", "password=", "crypted_password=", "nectar_id=", "vm_db_id="])
    except getopt.GetoptError as err:
        sys.stdout = sys.stderr
        logging.error("Error input" + str(err.msg))
        Usage() 
        
    logging.debug("Number of options: " + str(len(opts)))
    for opt, arg in opts:
        if opt == "--help":
            Usage() 
        elif opt == "--action":
            vmAction = arg
        elif opt == "--driver":
            vmDriver = arg
        elif opt == "--days":
            useDays = arg
        elif opt == "--username":
            username = arg
        elif opt == "--user_id":
            userId = arg
        elif opt == "--email":
            email = arg
        elif opt == "--server_id":
            # serverId is the VM instance ID, not the database ID
            serverId = arg
        elif opt == "--server_ip":
            serverIp = arg
        elif opt == "--server_name":
            serverName = arg
        elif opt == "--vm_db_id":
            # VM database ID
            vmDbId = arg
        elif opt == "--password":
            password = arg
        elif opt == "--path":
            path = arg
        elif opt == "--cpu":
            cpu = arg
        elif opt == "--nectar_id":
            nectarId = arg
        elif opt == "--userfullname":
            userFullName = arg
        elif opt == "--organization":
            organization = arg
        elif opt == "--createdby":
            accountCreatedBy = arg
        elif opt == "--approvedby":
            accountApprovedBy = arg
        elif opt == "--access_level":
            userAccessLevel = arg
        elif opt == "--project_group":
            projectGroup = arg
        elif opt == "--massive_account":
            massiveAccount = arg
        elif opt == "--crypted_password":
            cryptedPassword = arg
        else:
            message = "unhanded option " + opt
            assert False

    if vmAction == 0:
        sys.stdout = sys.stderr
        logging.debug("Missing action")
        Usage()

    command = RunCommand(vmAction, vmDriver, useDays, userId, username, password, serverId, path, cpu, vmDbId, serverIp, serverName, email, userFullName, organization, accountCreatedBy, accountApprovedBy, userAccessLevel, projectGroup, massiveAccount, cryptedPassword, nectarId)
    if command.run() == False:
        logging.debug("Failed to run command")
        sys.exit(1)

if __name__ == "__main__":
    main(sys.argv[1:])

