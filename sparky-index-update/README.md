# SYNOPSIS

Traverse [Sparky](https://github.com/melezhik/sparky) tasks and enable/disable sparrowhub index update setting.

# INSTALL

    $ s6 --install sparky-index-update

# USAGE

    # Enable index update setting
    $ s6 --plg-run sparky-index-update@dir=$PWD

    # Disable index update setting
    $ s6 --plg-run sparky-index-update@dir=$PWD,action=disable

# Parameters

## dir

Sparky root directory


## action

Action: `enable|disable`. Default vaulue is `enable`;

    # Enable index update

    ,action=enable

# See also

[Sparky](https://github.com/melezhik/sparky) - powerful pocket size task runner server in crontab style.

# Author

Alexey Melezhik

