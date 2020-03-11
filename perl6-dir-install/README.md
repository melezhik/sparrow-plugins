# SYNOPSIS

Walks through the list of sub directories ( located at $CWD ) and tries to install Perl6 modules found.

# INSTALL

    $ s6 --install perl6-dir-install

# USAGE

CLI:

    # go through every sub directory at $cwd
    # and runs `zef install . --force-install`
    # if directory contains META6.json file

    $ s6 --plg-run perl6-dir-install

# Author

Alexey Melezhik

# See also

* [zef](https://github.com/ugexe/zef)

