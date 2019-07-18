# SYNOPSIS

Simple wrapper for `short` script from Bash-Snippets.


# INSTALL

    $ s6 --install short

# USAGE

    $ s6 --task-set utils/short-unmusk-jhkj

      task-run "utils/short-unmusk-jhkj", "short", %(
        args => [
          'tinyurl.com/jhkj'
        ]
      );

    $ s6 --task-run utils/short-unmusk-jhkj

For short's arguments description follow [https://github.com/alexanderepstein/Bash-Snippets#short](https://github.com/alexanderepstein/Bash-Snippets#short)

# Authors

* The author of main script is [Alex Epstein](https://github.com/alexanderepstein)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



