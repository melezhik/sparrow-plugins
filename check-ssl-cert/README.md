# SYNOPSIS

Check if ssl certificates are expired.


# INSTALL

    $ s6 --install check-ssl-cert

# USAGE

/check-ssl-cert/README
/check-ssl-cert/README
    $ s6 --task-set monitoring/ssl-check

    hosts:
      - google.com
      - yandex.ru
    # check that certs are expired with 3 days
    expiration_date: 3

    $ s6 --task-run monitoring/ssl-check


# Author

Alexey Melezhik

