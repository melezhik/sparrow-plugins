# SYNOPSIS

Sparrow plugin for ddt utility.

# Platforms supported

* Any Linux

# INSTALL

    $ s6 --install raku-utils-ddt

# RUN

DSL. The plugin uses [args stringification](https://github.com/melezhik/Sparrow6/blob/master/documentation/development.md#args-stringification)
mechanism to convert Raku data into command line parameters, so one could write something like that:

    task-run "run tests", "raku-utils-ddt", %(
      args => [
        %( "-C" => "test" ),
      ]
    );

# Parameters

See parameters description at [ddt](https://github.com/kalkin/Ddt) documentation pages

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[Ddt](https://github.com/kalkin/Ddt)
