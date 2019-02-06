#!/usr/bin/env python

import ast
import sys
import logging
import re
import time
import argparse

import oyaml as yaml
from pyzabbix import ZabbixAPI


options = argparse.ArgumentParser(description='Get hostnames from Zabbix with active triggers by description via Zabbix api')
options.add_argument('--host', type=str, help="host of zabbix server", nargs="?")
options.add_argument("pattern", type=str, help="Your pattern")
options.add_argument('--user', type=str, help='Name of your user', default='zabbix', nargs="?")
options.add_argument('--password', type=str, help='Password for user', default='zabbix', nargs="?")
options.add_argument('--severity', type=int, help='Minimal severity of triggers', default=3, nargs="?")
options.add_argument('--duration', type=int, help='Minimal duration', default=5, nargs="?")
options.add_argument('--extended', help='Show trigger description', action='store_true')
options.add_argument('--with_values', help='Show values also', action='store_true')
options.add_argument('--debug', help='Debug for pyzabbix module', action='store_true')
options.add_argument('--output', type=str, metavar='path/to/file', help='/path/to/file OR stdout', default='stdout')
config = vars(options.parse_args())

output = config['output']

def main():

    debug = config['debug']

    if debug:
        stream = logging.StreamHandler(sys.stdout)
        stream.setLevel(logging.DEBUG)
        log = logging.getLogger('pyzabbix')
        log.addHandler(stream)
        log.setLevel(logging.DEBUG)

    zhost = config['host']
    user = config['user']
    password = config['password']
    pattern = config['pattern']
    min_severity = config['severity']
    trigger_until = config['duration']
    extended = config['extended']
    with_values = config['with_values']

    trigger_until_sec = int(trigger_until) * 60
    current_time = time.time()
    trigger_until_sec = current_time - trigger_until_sec

    zapi = ZabbixAPI(zhost)
    zapi.login(user, password)

    triggers = zapi.trigger.get(
        min_severity = min_severity,
        only_true = 'true',
        withLastEventUnacknowledged = 'true',
        lastChangeTill = trigger_until_sec
    )

    hostsinfo =''
    hostnames = ''
    trigger_ids=''
    for trigger in triggers:
        if trigger['value'] == '1':
            match = re.search(pattern, trigger['description'])
            if match:
                trigger_id = trigger['triggerid']

                if extended:

                    information = trigger['description']

                    host = zapi.host.get(
                        triggerids=(trigger_id)
                    )
                    hostname = host[0]['host']
                    #.encode('utf-8')

                    output_yaml = dict(
                        host = hostname
                    )

                    items = zapi.item.get(
                        triggerids=(trigger_id)
                    )
                    for index, item in enumerate(items):
                        value = item['lastvalue'] + item['units']

                        if len(items) > 1:
                            replace_pattern = re.compile('{' + 'ITEM.LASTVALUE' + str(index + 1) + '}')
                        else:
                            replace_pattern = re.compile("{ITEM.LASTVALUE}|{ITEM.LASTVALUE1}|{ITEM.VALUE}")


                        if with_values:
                            value_raw = item['lastvalue']
                            #.encode('utf-8')
                            key = 'value' + str(index)
                            output_yaml[key] = value_raw

                        information = re.sub(replace_pattern, value, information)
                        #.encode('utf-8')
                        output_yaml.update(alert = information)

                        info = yaml.safe_dump(output_yaml, encoding=('utf-8'), default_flow_style=False, allow_unicode=True).decode()


                    hostsinfo += info + '\n'

                else: 
                    trigger_ids +=  trigger_id + ","

    if trigger_ids:

        trigger_ids=ast.literal_eval(trigger_ids)
        hosts = zapi.host.get(
            triggerids=(trigger_ids)
        )

        for host in hosts:
            hostname = host['host']
            hostnames += hostname + '\n'
        return hostnames

    elif hostsinfo:
        return hostsinfo

    else:
        return "Found nothing"




if __name__ == "__main__":
    result = main()

    if output == 'stdout':
        print(result)
    else:
        f = open(output, 'w')
        f.write(result)
        f.close()

