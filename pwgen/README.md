# SYNOPSIS

Simple Perl Based password generator. Because `pwgen` is missing in Centos.

# INSTALL

    $ s6 --install pwgen

# USAGE

CLI:

    # generate password 16 symbols length
    $ s6 --plg-run pwgen@len=16

# Author

Alexey Melezhik

# See also

* [Text::Password::SHA](https://metacpan.org/pod/Text::Password::SHA)

