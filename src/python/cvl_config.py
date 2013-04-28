############### EDIT THESE ##############
VM_KEY_LOCATION     = 'EDIT_THIS'
VM_KEY_NAME         = 'EDIT_THIS'

VM_SECURITY_GROUP   = 'EDIT_THIS'

DATABASE_USER       = 'EDIT_THIS'
DATABASE_PASSWORD   = 'EDIT_THIS'

LOG_FILE            = 'EDIT_THIS'

CVL_HELP_EMAIL      = 'EDIT_THIS'
QUOTA_THRESHOLD     = 100 # EDIT_THIS

NOVA_EMAIL_ADDRESS  = 'EDIT_THIS'
NOVA_PASSWORD       = 'EDIT_THIS'
NOVA_TENANCY        = 'EDIT_THIS'
NOVA_URL            = 'EDIT_THIS'

############### / EDIT THESE ##############

VM_NAME = ['None', 'CvlNsVm', 'CvlSbVm', 'CvlEmVm', 'CvlAllVm']
VM_HOSTNAME = ['None', 'CvlNeuroScienceVm', 'CvlStructuralBiologyVm', 'CvlEnergyMaterialsVm', 'CvlAllVm']
VM_IMAGE_ID = ['28877b9b-d835-4dfe-8178-e1d32141477b',
               '28877b9b-d835-4dfe-8178-e1d32141477b',
               '28877b9b-d835-4dfe-8178-e1d32141477b',
               '28877b9b-d835-4dfe-8178-e1d32141477b',
               '28877b9b-d835-4dfe-8178-e1d32141477b']
VM_DEFAULT_CPU_ID = '0'
VM_CPU = [1, 2, 8, 16, 4]


DATABASE_NAME           = 'CvlUserManagementAdmin3'
DATABASE_USER_TABLE     = 'Cvl_users'
DATABASE_VM_USER_TABLE  = 'Cvl_cvl_vm_user'
DATABASE_USER_GROUP     = 'Cvl_usergroups'
DATABASE_USER_GROUP_MAP = 'Cvl_user_usergroup_map'
DATABASE_VM_TABLE       = 'Cvl_cvl_vm'
DATABASE_VM_LIST        = 'Cvl_cvl_server_list'

SERVER_HOST         = 'localhost'
SERVER_PORT         = 59290
SERVER_BUFFER       = 256

PRIVATE_KEY_NAME    = 'cvl_massive_key'
PUBLIC_KEY_NAME     = 'cvl_massive_key.pub'
