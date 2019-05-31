# SYNOPSIS

Simple wrapper for `short` script from Bash-Snippets.


# INSTALL

    $ s6 --install short

# USAGE

Basic usage:

    $ s6 --plg-run short -- <args>

For example:

    $ s6 --plg-run short -- tinyurl.com/jhkj

Run as sparrow task:

/short/sparrow

/short/sparrow

    $ s6 --task-set utils/short-unmusk-jhkj

      ---

      args:
        - tinyurl.com/jhkj

    $ s6 --task-run utils/short-unmusk-jhkj

For short's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#short](https://github.com/alexanderepstein/Bash-Snippets#short)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



