# SYNOPSIS

Example of a python Outthentic plugin

Extract IP and hostnames from zabbix server. 

Tested on zabbix version >= 3.2

# INSTALL

    $ sparrow plg install zabbix-hosts

## Dependencies
    
[pyzabbix](https://github.com/lukecyca/pyzabbix)

# USAGE

## Manually

    $ sparrow plg run zabbix-hosts --param user=foo --param password=bar --param host=127.0.0.1 --param output=/tmp/test.txt

    $ cat /tmp/test.txt
    127.0.0.1 zabbix-server
    192.168.0.1 fe.example.com

# Parameters

## user

A user to login. No default value. Obligatory.

## password

A password. Obligatory.

## host

IP or dns name of zabbix server. Obligatory.

## output 

Default is `stdout`. If any other specified output will be in a file.

# See also

[outthentic](https://github.com/melezhik/outthentic)

[sparrow](https://github.com/melezhik/sparrow)

