# SYNOPSIS

Simple wrapper for `speedtest-cli` from [https://github.com/sivel/speedtest-cli](https://github.com/sivel/speedtest-cli).


# INSTALL

    $ s6 --install speedtest-cli

# USAGE

Basic usage:

    $ s6 --plg-run speedtest-cli -- <args>

See parameters description at [https://github.com/sivel/speedtest-cli](%url).

If you need some automation:

/speedtest-cli/README

/speedtest-cli/README

    $ s6 --task-set utils/$task-name

      ---

      args:
        - foo
        - bar
        # - so on ...

    $ s6 --task-run utils/$task-name

# Asciicast example

[![asciicast](https://asciinema.org/a/128839.png)](https://asciinema.org/a/128839)

# Author

* The author of speedtest-cli tool is [@sivel](https://github.com/sivel)

* The sparrow plugin maintainer is [Alexey Melezhik](https://github.com/melezhik)



