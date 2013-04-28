
import cvl_config
import logging, logging.handlers
import traceback

class Environment:

    result = True

    @staticmethod
    def checkOrSet():
        import os
        try:
            rootLogger = logging.getLogger('')
            rootLogger.setLevel(logging.DEBUG)
            socketHandler = logging.handlers.SocketHandler('localhost', logging.handlers.DEFAULT_TCP_LOGGING_PORT)
            rootLogger.addHandler(socketHandler)

            if os.environ.get('OS_AUTH_URL') == None:
                os.environ['OS_AUTH_URL']       = 'https://keystone.rc.nectar.org.au:5000/v2.0/'
                os.environ['OS_TENANT_ID']      = 'EDIT_THIS'
                os.environ['OS_TENANT_NAME']    = 'EDIT_THIS'
                os.environ['OS_USERNAME']       = 'EDIT_THIS'
                os.environ['OS_PASSWORD']       = 'EDIT_THIS'

            return os

        except:
            logging.error('Set environment failed: ' + str(traceback.format_exc()))
            result = False

