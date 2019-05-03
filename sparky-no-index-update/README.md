# SYNOPSIS

Traverse [Sparky](https://github.com/melezhik/sparky) tasks and enable/disable sparrowhub index update setting.

# INSTALL

    $ s6 --install sparky-index-update

# USAGE

    # Enable index update setting
    $ sparrow plg run sparky-index-update --param dir=$PWD

    # Disable index update setting
    $ sparrow plg run sparky-index-update --param dir=$PWD --param action=disable

# Parameters

## dir

Sparky root directory


## action

Action: `enable|disable`. Default vaulue is `enable`;

    # Enable index update

    --param action=enable

# See also

[Sparky](https://github.com/melezhik/sparky) - powerful pocket size task runner server in crontab style.

# Author

Alexey Melezhik

