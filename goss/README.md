# SYNOPSIS

Simple goss wrapper


# INSTALL

    $ s6 --install goss


# USAGE


## Install goss

    $ s6 --plg-run goss # install goss binary file, default action

## Run goss scenarios

Goss scenarios get run as sparrow tasks:


/goss/README
/goss/README
    $ s6 --task-set audit/nginx 

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

    $ s6 --task-run audit/nginx


# Author

Alexey Melezhik


# See also


[Goss](https://github.com/aelsabbahy/goss)
