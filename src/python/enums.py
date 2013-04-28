
class Action:
    (NoAction, CreateServer, JoinServer, DeleteServer, UpdateServer, ChangePassword, CreateVmUserAccount, DeleteVmUserAccount, TerminateServer, AddServer) = range(0, 10)

class ProjectGroup:
    # FIXME this isn't used anywhere
    (Invalid, MelbournUniversityNectar, MonashNectar) = range(0, 3)

class OperationState:
    (Idle, Process, Active, Error) = range(0, 4)

class ProjectGroup:
    (Invalid, CvlMonash) = range(0, 2)
    Project = ["None", "CvlMonash"]

class State:
    (Exception, Error, NotFind, Ok, Find) = range(0, 5)

class UserAccess:
    (Invalid, User, Administrator) = range(0, 3)

class VmState:
    (Idle, Configuration, Active, Error) = range(0, 4)
    state = {"IDLE":0, "SETUP":1, "ACTIVE":2, "ERROR":3}

