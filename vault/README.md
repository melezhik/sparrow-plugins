# SYNOPSIS

Simple wrapper for `vault`


# INSTALL

    $ s6 --install vault

# USAGE

Basic usage:

    $ sparrow plg run vault -- <args>

For example:

    $ sparrow plg run vault -- --erase_vault

See parameters description at [https://github.com/gabfl/vault](https://github.com/gabfl/vault)

If you need some automation:

    $ sparrow project create utils

    $ sparrow task add utils vault-eraser vault

    $ sparrow task ini utils/vault-eraser

      args:
        - 
          - e

    $ sparrow task run utils/vault-eraser

# Author

* The author of main script is [https://github.com/gabfl](https://github.com/gabfl)
* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



