# SYNOPSIS

Simple wrapper for `geo` script from Bash-Snippets.


# INSTALL

    $ s6 --install geo

# USAGE

Basic usage:

    $ s6 --plg-run geo -- <args>

For example:

    $ s6 --plg-run geo -- -r -d -m eth0

Run as sparrow task:

/geo/sparrow

/geo/sparrow

    $ s6 --task-set utils/geo-data

      ---

      args:
        - '-r'
        - '-d'
        - '~m' : eth0

    $ s6 --task-run utils/geo-data

For geo's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#geo](https://github.com/alexanderepstein/Bash-Snippets#geo)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)
