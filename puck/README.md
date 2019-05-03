# SYNOPSIS

Simple wrapper for `puck` script from https://github.com/NativeInstruments/puck.


# INSTALL

    $ s6 --install puck

# USAGE

Basic usage:

    $ sparrow plg run puck -- <args>

See parameters description at [https://github.com/NativeInstruments/puck](https://github.com/NativeInstruments/puck)

If you need some automation:

    $ sparrow project create utils

    $ sparrow task add utils $task-name puck

    $ sparrow task ini utils/$task-name

      ---

      args:
        - foo
        - bar
        - # so on

    $ sparrow task run utils/$task-name

# Author

* The author of main script is [Christian Stefanescu](https://github.com/stchris)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



