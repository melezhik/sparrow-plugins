# SYNOPSIS

Simple wrapper for `crypt` script from Bash-Snippets.


# INSTALL

    $ s6 --install crypt

# USAGE

Basic usage:

    $ s6 --plg-run crypt -- <args>

Run as sparrow task:

/crypt/sparrow

/crypt/sparrow

    $ s6 --task-set utils/enc-file

      ---

      args:
        - '-e'
        - /tmp/file.txt
        - /tmp/file.txt.inc

    $ s6 --task-run utils/enc-file

For crypt's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#cheat](https://github.com/alexanderepstein/Bash-Snippets#crypt)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



