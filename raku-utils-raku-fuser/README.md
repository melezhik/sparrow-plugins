# SYNOPSIS

Sparrow plugin for Linux::Fuser - Discover which process has a file open, in pure Raku.

# INSTALL

     s6 --install raku-utils-raku-fuser

# Usage

The plugin uses [args stringification](https://github.com/melezhik/Sparrow6/blob/master/documentation/development.md#args-stringification)
mechanism to convert Raku data into command line parameters, so a typical usage is something like that:

    task-run "run raku-fuser", "raku-utils-raku-fuser", %(
      args => [
        # some Raku parameters
        # that map command line
        # invocation
      ]
    );

# Parameters

See parameters description at [Linux::Fuser](https://modules.raku.org/dist/Linux::Fuser:cpan:JSTOWE) documentation pages.

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[Linux::Fuser](https://modules.raku.org/dist/Linux::Fuser:cpan:JSTOWE)

