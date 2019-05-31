# SYNOPSIS

Simple wrapper for `stocks` script from Bash-Snippets.

# INSTALL

    $ s6 --install stocks

# USAGE

Basic usage:

    $ s6 --plg-run stocks -- <args>
    
For example:

    $ sparrow pl run stocks -- Google

Run as sparrow task:

/stocks/sparrow

/stocks/sparrow

    $ s6 --task-set utils/google-stocks

      ---

      args:
        - Google

    $ s6 --task-run utils/google-stocks

For stocks's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#stocks](https://github.com/alexanderepstein/Bash-Snippets#stocks)
    
# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)
