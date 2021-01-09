# SYNOPSIS

Provide fez login

# INSTALL

    $ s6 --install fez-login

# USAGE

Cli

    $ s6 --plg-run fez-login@user=melezhik,password=superSECRET123

Raku API

    task-run "fez login", "fez-login", %(
      user => "melezhik",
      password => "superSecret123"
    );

# Parameter

## user

user name

## password

password

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
