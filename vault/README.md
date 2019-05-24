# SYNOPSIS

Simple wrapper for `vault`


# INSTALL

    $ s6 --install vault

# USAGE

Basic usage:

    $ s6 --plg-run vault -- <args>

For example:

    $ s6 --plg-run vault -- --erase_vault

See parameters description at [https://github.com/gabfl/vault](https://github.com/gabfl/vault)

If you need some automation:

/vault/README

/vault/README

    $ s6 --task-set utils/vault-eraser

      args:
        - 
          - e

    $ s6 --task-run utils/vault-eraser

# Author

* The author of main script is [https://github.com/gabfl](https://github.com/gabfl)
* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



