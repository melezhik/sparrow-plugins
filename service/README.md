# SYNOPSIS

Manages Linux services.

The list of supported actions:

* start
* stop
* restart
* enable
* disable

# Prerequisites

* For Centos(5,6) `chkconfig` utility should be installed.
* For Alpine linux `openrc` should be installed.
* For Funtoo `openrc` should be installed.

# INSTALL

    $ s6 --install service


# USAGE

## Cli

    $ s6 --plg-run service@service=nginx,action=enable
    $ s6 --plg-run service@service=nginx,action=start
    $ s6 --plg-run service@service=nginx,action=stop

## Raku

    $ cat sparrowfile

    task_run "enable nginx service", "service", %(:action<enable>, :service<nginx>);

    task_run "start nginx service", "service", %(:action<start>, :service<nginx>);
  
# Parameters

## service

A service name.

## action

One of five: `(enable|disable|start|stop|restart)`. Default value is `enable`. Should be set.

# Platforms supported

* Debian
* Ubuntu
* CentOS
* Amazon Linux ( limited API, enable/disable actions are not yet supported )
* Archlinux
* Minoca
* Funtoo
* OpenSUSE

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)


