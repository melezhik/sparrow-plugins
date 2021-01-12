# SYNOPSIS

Sets fez account meta info

# INSTALL

    $ s6 --install fez-meta

# USAGE

Cli

    $ s6 --plg-run fez-meta@name="Alexey Melezhik",website=https://sparrowhub.io,email=melezhik@gmail.com

Raku API

    task-run "my fez meta", "fez-meta", %(
      name => "Alexey Melezhik",
      website => "https://sparrowhub.io",
      email => "melezhik\@gmail.com"
    );

# Parameter

## name

Display name

## website

Web site

# email

Account email

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
