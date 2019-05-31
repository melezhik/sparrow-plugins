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

## Manually 

    $ s6 --plg-run package-generic@list='curl telnet nano'

## Sparrowdo

    task-run 'install my packages', 'package-generic', %(
      list => 'nano hunspell mc'
    );
    
# Plugin parameters

## list

Should be space separated list of packages to install. Example of usage by sparrow task:
 
    list nano hunspell mc

## action

Should be one of two: `install|autoremove`. Autoremove is only supported for Debian, Ubuntu systems.
Default value `install`;

# Installing OS depended packages 

You may pass `list` as HASH with keys related to OS distribution names
to handle packages respectively to OS, here is the example with using YAML format:

/package-generic/README
/package-generic/README
    $ s6 --task-set packages/apache
    
    list:
      debian:
        - apache2
      centos:
        - httpd 
        - mod_ssl
    
    $ s6 --task-run packages/apache


Or using sparrowdo:

    task-run 'install apache web server', 'package-generic', %(
      list => %(
        'debian' => [ 'apache2' ],
        'centos7' => [ 'httpd', 'mod_ssl' ],
      )
    );


# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
