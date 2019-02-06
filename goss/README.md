# SYNOPSIS

Simple goss wrapper


# INSTALL

    $ sparrow plg install goss


# USAGE


## Install goss

    $ sparrow plg run goss # install goss binary file, default action

## Run goss scenarios

Goss scenarios get run as sparrow tasks:


    $ sparrow project create audit
    $ sparrow task add audit nginx goss
    $ sparrow task ini audit/nginx 

    action validate
    goss <<HERE

    port:
      tcp:80:
        listening: true
        ip:
        - 0.0.0.0
    service:
      nginx:
        enabled: true
        running: true
    process:
      nginx:
        running: true
    
    HERE

    $ sparrow task run audit/nginx


# Author

Alexey Melezhik


# See also


[Goss](https://github.com/aelsabbahy/goss)
