# SYNOPSIS

Check if ssl certificates are expired.


# INSTALL

    $ s6 --install check-ssl-cert

# USAGE

    task-run "check, "check-ssl-cert", %(
      hosts => [ 
        'google.com',
        'yandex.ru'
      ],
      # check that certs are expired with 3 days
      expiration_date => 3
    );

# Author

Alexey Melezhik

