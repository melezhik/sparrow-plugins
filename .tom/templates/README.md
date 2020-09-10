# SYNOPSIS

[% desc %].

# INSTALL

    $ s6 --install [% name %]

# Usage

The plugin uses [args stringification](https://github.com/melezhik/Sparrow6/blob/master/documentation/development.md#args-stringification)
mechanism to convert Raku data into command line parameters, so a typical usage is something like that:

    task-run "run [% bin %]", "[% name %]", %(
      args => [
        # some Raku parameters
        # that map command line
        # invocation
      ]
    );

# Parameters

See parameters description at [[% module %]]([% url %]) documentation pages.

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[[% module %]]([% url %])

