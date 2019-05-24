# SYNOPSIS

Install CPAN modules using App::cpm - a fast CPAN module installer.

# Prerequisites

App::cpm client (cpm)

# INSTALL

    $ s6 --install app-cpm

# USAGE

## Manually

    $ s6 --plg-run app-cpm@list="'CGI DBI Moose'"

## Via sparrowdo

    task_run  %(
      task => 'install some modules',
      plugin => 'app-cpm',
      parameters => %( 
        list => 'CGI DBI Moose',
        install-base => '/var/app/',
        verbose => 1
      )
    );
    
# Plugin parameters

## list

Should be space separated list of packages to install. 

For example:

    list CGI DBI Moose

## workers

Number of cpm workers, see App::cpm docs.

## verbose

Sets verbose mode on. See --verbose paraneter for cpm client.

## install-base

Sets install base, see also -L parameter for cpm client.

## http_proxy

Specify http proxy server to use when installing cpan packages.

## https_proxy

Specify https proxy server to use when installing cpan packages.

# See also

[App::cpm](https://metacpan.org/pod/App::cpm)

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)



