# SYNOPSIS

Lint BIND9/named kind of config files

# INSTALL

    $ s6 --install config-bindish-check

# USAGE

    # Lint config.named file
    task-run "conf-lint", "config-bindish-check", %(
      path => "config.named"
    );

# See also

[Config::BINDish](https://github.com/vrurg/raku-Config-BINDish)

Windows, Linux, Mac OS

# Author

Alexey Melezhik

