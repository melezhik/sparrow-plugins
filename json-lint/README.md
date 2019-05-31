# SYNOPSIS

Simple json linter.

# INSTALL

    $ s6 --install json-lint

# USAGE

CLI:

    # check for files named *.json, *.js inside $PWD
    $ s6 --plg-run json-lint@path=$PWD

    # check for files named *.json, *.js inside $PWD/location
    $ s6 --plg-run json-lint@path=$PWD/location

# Author

Alexey Melezhik

