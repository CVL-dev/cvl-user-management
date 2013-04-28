#!/usr/bin/python

from CvlEnvironment import Environment
import sys, traceback
import logging
import utils
import cvl_config

if len(sys.argv) < 2:
    logging.error("Missing argument: number of requested CPUs")
    sys.exit(1)

numberCpu = sys.argv[1]
try:
    if Environment.checkOrSet() == False:
        logging.error("Failed to set environment credential")
        sys.exit(1)
    else:
        availableCpu = utils.get_nr_available_vcpus()
        logging.debug("numberCpu index: " + str(numberCpu) + " number cpu: " + str(cvl_config.VM_CPU[int(numberCpu)]) + " available CPU: " + str(availableCpu));
        if availableCpu <= cvl_config.QUOTA_THRESHOLD:

            utils.send_email(cvl_config.CVL_HELP_EMAIL,
                             "CVL project resource warning",
                             "Warning: there are only " + str(availableCpu) + " CPUs available in the %s tenancy." % (utils.nova_client().project_id,))

        if availableCpu < cvl_config.VM_CPU[int(numberCpu)]:
            message = "Resources for " + str(cvl_config.VM_CPU[int(numberCpu)]) + " CPUs are not available"
            print message
            logging.error(message)
        print "OK"
except:
    logging.error("Exception:" + traceback.format_exc())
    sys.exit(1)
