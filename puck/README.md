# SYNOPSIS

Simple wrapper for `puck` script from https://github.com/NativeInstruments/puck.


# INSTALL

    $ s6 --install puck

# USAGE

Basic usage:

    $ s6 --plg-run puck@<args>

See parameters description at [https://github.com/NativeInstruments/puck](https://github.com/NativeInstruments/puck)

Sparrow DSL:

    task-run "run puck", "puck", %(
      args => [
        %( requirements-file => "requirements.txt" ), 
        [ "show-all" ]
      ]
    );

# Author

* The author of main script is [Christian Stefanescu](https://github.com/stchris)

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



