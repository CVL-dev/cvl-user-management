#!/usr/bin/python

import traceback, shlex
import logging


class SingleOutputCommand:

    def __init__(self, command):
        self.command = shlex.split(command)
        self.result = True
        self.error = ""
        self.output = ""

        logging.debug('SingleOutputCommand: ' + str(self.command))

    def checkError(self):
        return self.error

    def getOutput(self):
        return self.output

    def run(self):
        import subprocess as sp
        try:
            process = sp.Popen(self.command, stdout=sp.PIPE, stderr=sp.PIPE)
            self.output, self.error = process.communicate()
            logging.debug('SingleOutputCommand: <%s>, stdout: <%s>, stderr: <%s>' % (str(self.command), self.output, self.error,))
        except:
            self.result = False
            logging.error("Execution command failed" + traceback.format_exc())
        finally:
            logging.error("Returning: " + str(result))
            return self.result

class BackgroundCommand:

    def __init__(self, command):
        self.command = shlex.split(command)
        self.result = True
        self.error = ""
        self.output = ""
        
        logging.debug('BackgroundCommand: ' + str(self.command))

    def run(self):
        import subprocess as sp
        try:
            process = sp.Popen(self.command)
            logging.debug("Started background process: " + str(self.command))
        except:
            self.result = False
            logging.error("Execution command failed" + traceback.format_exc())
        finally:
            return self.result

class MultiOutputCommand:
    def __init__(self, command):
        self.command = shlex.split(command)
        self.result = True
        self.message = "Run command " + command + ": "
        self.error = ""
        self.output = []

        logging.debug('MultiOutputCommand: ' + str(self.command))

    def getOutput(self):
        return self.output

    def checkError(self):
        return self.error

    def run(self):
        logging.debug('MultiOutputCommand, running command = <%s>' % self.command)

        try:
            pipe = sp.Popen(self.command, stdout=sp.PIPE, stderr=sp.PIPE)
            self.error = pipe.stderr.readline()
            if self.error == "":

                while True:
                    line = pipe.stdout.readline()
                    if line == "":
                        break
                    else:
                        self.output.append(line)
        except:
            self.result = False
            self.message("exception")
        finally:
            logging.debug('MultiOutputCommand output: '       + str(self.output))
            logging.debug('MultiOutputCommand self.message:'  + str(self.message))
            logging.debug('MultiOutputCommand self.result:'   + str(self.result))
            return self.result

class ProcessShellCommand:
    def __init__(self, command):
        self.command = shlex.split(command)
        self.result = False
        self.message = "Run shell command " + command + ": "

    def run(self):
        import subprocess as sp
        try:
            if sp.check_call(self.command) == 0:
                self.result = True
        except:
            self.message("failed")
        finally:
            logging.debug(self.message)
            return self.result

