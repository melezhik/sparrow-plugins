# SYNOPSIS

A simple wrapper to automate [perlbrew](http://perlbrew.pl) installation.

# INSTALL

    $ s6 --install perlbrew

# USAGE


## Install perlbrew
  
    # install perlbrew - this is default action  
    $ s6 --plg-run perlbrew

    # or say it explecitely
    $ s6 --plg-run perlbrew@action=install


# Supported platfroms

* Ubuntu
* Debian

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See Also

[Perlbrew](http://perlbrew.pl)


