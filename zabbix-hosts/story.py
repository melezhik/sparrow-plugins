
from outthentic import *
from pyzabbix import ZabbixAPI


zhost = config()['host']
user = config()['user']
password = config()['password']
output = config()['output']


zapi = ZabbixAPI(zhost)
zapi.login(user, password)
hosts = zapi.host.get(
    with_items=1,
    selectInterfaces='extend',
)

if output == 'stdout':
   for h in hosts:
       print("%s %s" % (h['interfaces'][0]['ip'], h['host']))
else:
    f = open(output, 'w')

    for h in hosts:
        f.write( "%s %s\n" % (h['interfaces'][0]['ip'], h['host']))

    f.close()

