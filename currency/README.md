# SYNOPSIS

Simple wrapper for `currency` script from Bash-Snippets.


# INSTALL

    $ s6 --install currency

# USAGE

Basic usage:

    $ s6 --plg-run currency -- <args>

For example:

    $ s6 --plg-run currency -- USD RUB 100

Run as sparrow task:

/currency/sparrow

/currency/sparrow

    $ s6 --task-set utils/currency-usd-rub

      ---

      args:
        - USD
        - RUB
        - 100

    $ s6 --task-run utils/currency-usd-rub

For currency's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#currency](https://github.com/alexanderepstein/Bash-Snippets#currency)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



