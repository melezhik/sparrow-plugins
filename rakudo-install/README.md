# SYNOPSIS

Install Rakudo as a system package.

# Description

This is simple installer of Rakudo Perl6.

Platforms supported:

* CentOS
* Ubuntu
* Debian
* Fedora
* Alpine
* Archlinux ( limited support )

*note*: for archlinux [zef](https://github.com/ugexe/zef) will not be installed because the installer uses a [user](https://spider-mario.quantic-telecom.net/archlinux/rakudo) binary repo without zef package.

# Install

    $ s6 --install rakudo-install

# Usage

## List available distributions

    $ sparrow plg run rakudo-install --param search=ubuntu

## Install Rakudo with default distribution

Be aware that defaults might point to pretty old versions:

    $ sparrow plg run rakudo-install

## Set distro's url explicitly

This is preferable method:

    $ sparrow plg run rakudo-install \
    --param url=https://github.com/nxadm/rakudo-pkg/releases/download/v2017.11/rakudo-pkg-Debian8.9_2017.11-01_amd64.deb


## Sparrowdo usage

You can use Sparrowdo to install Rakudo:

    $ cat sparrowfile

    task-run 'install Rakudo', 'rakudo-install', %(
      url =>  'https://github.com/nxadm/rakudo-pkg/releases/download/v2017.11/rakudo-pkg-Debian8.9_2017.11-01_amd64.deb'
    );

# Author

Alexey Melezhik

# See also

[rakudo-pkg project](https://github.com/nxadm/rakudo-pkg)

