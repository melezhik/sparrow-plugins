# SYNOPSIS

Sparrow plugin for fez - one way to upload your dists to the masses.

# INSTALL

     s6 --install raku-utils-fez

# Usage

The plugin uses [args stringification](https://github.com/melezhik/Sparrow6/blob/master/documentation/development.md#args-stringification)
mechanism to convert Raku data into command line parameters, so a typical usage is something like that:

```
task-run "fez login", "raku-utils-fez", %(
  args => [
    # some Raku parameters
    # that map command line
    # invocation
    'login'
  ]
);
```

# Parameters

See parameters description at [fez](https://github.com/tony-o/raku-fez.git) documentation pages.

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[fez](https://github.com/tony-o/raku-fez.git)

