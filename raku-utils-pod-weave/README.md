# SYNOPSIS

Sparrow plugin for Pod::Weave pod-weave utility.

# INSTALL

     s6 --install raku-utils-pod-weave

# Usage

The plugin uses [args stringification](https://github.com/melezhik/Sparrow6/blob/master/documentation/development.md#args-stringification)
mechanism to convert Raku data into command line parameters, so a typical usage is something like that:

    task-run "run pod-weave", "raku-utils-pod-weave", %(
      args => [
        # some Raku parameters
        # that map command line
        # invocation
      ]
    );

# Parameters

See parameters description at [Pod::Weave](https://github.com/codesections/pod-weave) documentation pages.

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[Pod::Weave](https://github.com/codesections/pod-weave)

