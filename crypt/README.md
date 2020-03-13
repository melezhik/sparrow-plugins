# SYNOPSIS

Simple wrapper for `crypt` script from Bash-Snippets.


# INSTALL

    $ s6 --install crypt

# USAGE

Basic usage:

    $ s6 --plg-run crypt -- <args>

For example:


    $ s6 --plg-run crypt@args="-e /tmp/file.txt /tmp/file.txt.incrypted"

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



