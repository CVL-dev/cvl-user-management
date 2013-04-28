from utils import nova_client, get_vm_info
from cvlsql import Cvl_cvl_vm

nc = nova_client()

db_vms   = list(Cvl_cvl_vm.select())
nova_vms = nc.servers.list()

db_ips   = [x.vmIp for x in db_vms]
nova_ips = [get_vm_info(x.name)['ip'] for x in nova_vms]

# VMs with the same name?

duplicate_db_names   = [x.vmServerName for x in db_vms    if len([y for y in db_vms   if y.vmServerName == x]) > 1]
duplicate_nova_names = [x.name         for x in nova_vms  if len([y for y in nova_vms if y.name         == x]) > 1]

if len(duplicate_db_names) > 0:
    print 'Multiple VMs exist in the database with the following names:', duplicate_db_names
if len(duplicate_nova_names) > 0:
    print 'Multiple VMs exist in Nectar with the following names:', duplicate_nova_names

# Unmanaged VMs?
unmanaged_vms = [x for x in nova_vms if get_vm_info(x.name)['ip'] not in db_ips]

if len(unmanaged_vms) > 0:
    print 'VMs in Nectar tenancy %s that are not managed by by the User Management system:' % (nc.project_id,)
    for x in unmanaged_vms:
        print get_vm_info(x.name)['ip'], x.name
    print

# Orphaned VM records?
orphaned_vms = [x for x in db_vms if x.vmIp not in nova_ips]
if len(orphaned_vms) > 0:
    print 'VMs in the database that do not exist in the %s tenancy:' % (nc.project_id,)
    for x in orphaned_vms:
        print x.vmIp, x.vmServerName
    print

