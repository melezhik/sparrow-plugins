# SYNOPSIS

Simple wrapper for `cheat` script from Bash-Snippets.


# INSTALL

    $ s6 --install cheat

# USAGE

Basic usage:

    $ s6 --plg-run cheat -- <args>

For example:

    $ s6 --plg-run cheat -- -i Perl

Run as sparrow task:

/cheat/sparrow

/cheat/sparrow

    $ s6 --task-set utils/cheat-perl

      ---

      args:
        - '-i'
        - Perl

    $ s6 --task-run utils/cheat-perl

For cheat's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#cheat](https://github.com/alexanderepstein/Bash-Snippets#cheat)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



