# SYNOPSIS

Generic package manager. Installs packages using OS specific package managers.

OS supported:

* Debian, Ubuntu - apt
* CentOS, Fedora - yum
* Alpine Linux   - apk
* Archlinux      - pacman
  
# INSTALL

    $ s6 --install package-generic

# USAGE

## Cli

    $ s6 --plg-run package-generic@list='curl telnet nano'

## API

    task-run 'install my packages', 'package-generic', %(
      list => 'nano hunspell mc'
    );

DSL shortcut:

  package-install 'nano hunspell mc';
    
# Plugin parameters

## list

Should be space separated list of packages to install
 
    list nano hunspell mc

## action

Should be one of two: `install|autoremove`. Autoremove is only supported for Debian, Ubuntu systems.
Default value is `install`;

# Installing OS depended packages 

One may install OS dependent packages using list HASH notation:

    task-run 'install apache web server', 'package-generic', %(
      list => %(
        'debian' => ( 'apache2' ),
        'centos7' => ( 'httpd', 'mod_ssl' ),
      )
    );


# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
