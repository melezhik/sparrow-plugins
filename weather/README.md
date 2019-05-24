# SYNOPSIS

Simple wrapper for `weather` script from Bash-Snippets.


# INSTALL

    $ s6 --install weather

# USAGE

Basic usage:

    $ s6 --plg-run weather -- <args>

For example:

    $ s6 --plg-run weather -- Saint-Petersburg

Run as sparrow task:

/weather/sparrow

/weather/sparrow

    $ s6 --task-set utils/weather-spb

      ---

      args:
        - Saint-Petersburg

    $ s6 --task-run utils/weather-spb

For weather's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#weather](https://github.com/alexanderepstein/Bash-Snippets#weather)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



