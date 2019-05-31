# SYNOPSIS

Simple wrapper for `ytview` script from Bash-Snippets.


# INSTALL

    $ s6 --install ytview

# USAGE

Basic usage:

    $ s6 --plg-run ytview -- <args>

For example:

    $ s6 --plg-run ytview -- -s Family Guy Chicken Fight

Run as sparrow task:

/ytview/sparrow

/ytview/sparrow

    $ s6 --task-set utils/ytview-fg

      ---

      args:
        - '-s'
        - Family Guy Chicken Fight

    $ s6 --task-run utils/ytview-fg

For ytview's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#ytview](https://github.com/alexanderepstein/Bash-Snippets#ytview)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



