# SYNOPSIS

Get zabbix's hostnames by description of trigger.

Tested on zabbix 3.2+.

Python - 3

# INSTALL

    $ sparrow plg install zabbix-hosts-by-alerts

## Dependencies

[pyzabbix](https://github.com/lukecyca/pyzabbix)

[oayml](https://github.com/wimglenn/oyaml)

# USAGE

## Manually
 
    $ ./zabbix-hosts-by-alerts --user foo --password bar --host 127.0.0.1
      "Server unreachable"


## Sparrow usage
This script is being wrapped by sparrow as outthentic plugin. For installation you can

    $ sparrow plg install zabbix-hosts-by-alerts

And if you want to run this script

    $ sparrow plg run zabbix-hosts-by-alerts -- --user foo --password bar --host 127.0.0.1
    "Server unreachable"
     
    test.example.ru
    test2.example.ru

# Parameters

## user
 
 A user to login. Default is `zabbix`. Obligatory.
 
## password
 
 A password. Obligatory. Default is `zabbix`.
 
## host
 
 IP of zabbix server. Obligatory.

## pattern
 
 Part of alert's description. Obligatory.

## output 

 Default is `stdout`. If any other specified output will be in file.

## severity

 Minimal severity of alert. Default is `3`

## duration

 Minimal duration for alert being in BAD state. Default is `5 minutes`

## extended(flag)

 if true then adds to output description of trigger in YAML. For example:
    $ ./zabbix-hosts-by-alerts --user foo --password bar --host 127.0.0.1 
      "Server unreachable" --extended

    host: server2.example.ru
    alert: Server is unreachable 
     
    host: server1.example.ru
    alert: Server is unreachable 

### with_values(flag)
 if true then adds value lastvalue to output.

    host: server2.example.ru
    alert: 'Available memory: 3.1334% 1589039104B'
    value1: '1589039104'
    value0: '3.1334'
     
    host: server1.example.ru
    alert: 'Available memory: 2.9393% 1491988480B'
    value1: '1491988480'
    value0: '2.9393'


# See also

[sparrowdo](https://github.com/melezhik/sparrowdo)

[sparrow](https://github.com/melezhik/sparrow)
