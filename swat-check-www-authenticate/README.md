# swat-check-www-authenticate

Simple swat checker for http server return "WWW-Authenticate:" header.

# INSTALL

    $ sparrow plg install swat-check-www-authenticate
    $ sparrow project create monitoring 
    $ sparrow task add monitoring site swat-check-www-authenticate
    $ sparrow task ini monitoring/site
    hosts:
      - host1
      - host2
      - host3
    $ sparrow task run monitoring/site

# Author

Alexey Melezhik
