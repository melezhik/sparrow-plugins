# SYNOPSIS

CPAN modules installer

# Prerequisites

cpanm client ( as it used to install cpan modules )


# INSTALL

    $ s6 --install cpan-package

# USAGE

## Cli

    $ s6 --plg-run cpan-package@list="App::cpm local::lib"

## Api

    task-run 'install some modules', 'cpan-package', %( 
      list => 'App::cpm local::lib',
      install-base => '/var/app/'
    );
    

# Plugin parameters

## list

Should be space separated list of packages to install. For example:

    list CGI DBI Moose

## install-base

Specify the install base to install modules. See also `-l` parameter for cpanm client.

## user

Specify a user which runs installer process. Normally you would need it when install modules into someone's home directory.

## http_proxy

Specify http proxy server to use when installing cpan packages

## https_proxy

Specify https proxy server to use when installing cpan packages

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)


