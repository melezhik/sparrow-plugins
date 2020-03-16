# SYNOPSIS

Simple wrapper for `puck` script from https://github.com/NativeInstruments/puck.


# INSTALL

    $ s6 --install puck

# USAGE

Basic usage:

    $ s6 --plg-run puck <args>

For example:

    $ s6 --plg-run puck@args="--requirements-file requirements.txt --show-all"

See parameters description at [https://github.com/NativeInstruments/puck](https://github.com/NativeInstruments/puck)


# Author

* The author of main script is [Christian Stefanescu](https://github.com/stchris)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



