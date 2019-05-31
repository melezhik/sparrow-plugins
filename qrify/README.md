# SYNOPSIS

Simple wrapper for `qrify` script from Bash-Snippets.


# INSTALL

    $ s6 --install qrify

# USAGE

Basic usage:

    $ s6 --plg-run qrify -- <args>

For example:

    $ s6 --plg-run qrify -- hello world

Run as sparrow task:

/qrify/sparrow

/qrify/sparrow

    $ s6 --task-set utils/qrify-text

      ---

      args:
        - Hello world

    $ s6 --task-run utils/qrify-text

For qrify's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#qrify](https://github.com/alexanderepstein/Bash-Snippets#qrify)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



