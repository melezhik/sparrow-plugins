# SYNOPSIS

App::Mi6 mi6 utility

# Platforms supported

* Any Linux

# INSTALL

    $ s6 --install raku-utils-mi6

# RUN

DSL. The plugin uses [args stringification](https://github.com/melezhik/Sparrow6/blob/master/documentation/development.md#args-stringification)
mechanism to convert Raku data into command line parameters, so one could write something like that:

    # run `mi6 --keep release`
    task-run "module release", "raku-utils-mi6", %(
      args => [
        ["keep"],
        "release"
      ]
    );

# Parameters

See parameters description at [mi6](https://modules.raku.org/dist/App::Mi6:cpan:SKAJI) documentation pages

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[mi6](https://modules.raku.org/dist/App::Mi6:cpan:SKAJI)
