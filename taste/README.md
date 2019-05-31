# SYNOPSIS

Simple wrapper for `taste` script from Bash-Snippets.


# INSTALL

    $ s6 --install taste

# USAGE

Basic usage:

    $ s6 --plg-run taste -- <args>

For example:

    $ s6 --plg-run taste -- -s Red Hot Chili Peppers

Run as sparrow task:

/taste/sparrow

/taste/sparrow

    $ s6 --task-set utils/taste-rhcp

      ---

      args:
        - '-s'
        - Red Hot Chili Peppers

    $ s6 --task-run utils/taste-rchp

For taste's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#taste](https://github.com/alexanderepstein/Bash-Snippets#taste)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



