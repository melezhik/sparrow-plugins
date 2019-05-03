# SYNOPSIS

Check if ssl certificates are expired.


# INSTALL

    $ s6 --install check-ssl-cert

# USAGE

    $ sparrow project create monitoring 
    $ sparrow task add monitoring ssl-check check-ssl-cert
    $ sparrow task ini monitoring/ssl-check

    hosts:
      - google.com
      - yandex.ru
    # check that certs are expired with 3 days
    expiration_date: 3

    $ sparrow task run monitoring/ssl-check


# Author

Alexey Melezhik

