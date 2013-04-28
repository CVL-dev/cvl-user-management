#!/usr/bin/python

import cvl_config
from CvlCommand import MultiOutputCommand
from CvlEnvironment import Environment
import traceback
import logging
import utils

class LaunchVm:

    def __init__(self, serverName, driver, cpu):
        self.serverName = serverName
        self.driver = driver 
        self.result = True
        self.cpu = int(cpu)

        logging.debug('LaunchVm:', str((self.serverName, self.driver, self.result, self.cpu,)))

    def createInstance(self):
        try:
            if Environment.checkOrSet() == False:
                self.result = False
                logging.error("Failed to set environment credential")
            else:
                nr_available_vcpus = utils.get_nr_available_vcpus()

                if nr_available_vcpus < cvl_config.VM_CPU[self.cpu]:
                    message = "Required CPU " + cvl_config.VM_CPU[self.cpu] + " exceedes quota available CPU " + nr_available_vcpus
                    logging.error(message)
                    return False

                imageId = cvl_config.VM_IMAGE_ID[int(self.driver)]
                show = "nova boot " + "--flavor " + str(self.cpu) + " --image " + imageId + " --key_name " + cvl_config.VM_KEY_NAME + " --security_groups " + cvl_config.VM_SECURITY_GROUP + " \"" + self.serverName + "\""
                command = MultiOutputCommand(show)
                if command.run() == False:
                    self.result = False
                    logging.error("Failed to run command")
                else:
                    output = command.getOutput()
                    logging.debug('Output of nova boot command: ' + output)

                    for data in output:
                        dataList = data.split(":")
                        if dataList.__len__() > 0:
                            if dataList[0].strip() == "ERROR":
                                logging.error("Failed to launch an instance")
                                self.result = False
        except:
            self.result = False
            logging.error("Exception: " + traceback.format_exc())
        finally:
            logging.debug('Returning:', self.result)
            return self.result
