# SYNOPSIS

Outthentic plugin.

Build packages from AUR for archlinux

# INSTALL

    # sparrow plg install aur-builder

# USAGE
## Manually
    
    # sparrow plg run aur-builder --param list="( zef yaourt )"

## Via Sparrowdo
    
    $ cat sparrofile

    task_run 'install zef', 'aur-builder', %(
      list => ( 'chef-dk', 'yaourt' ),
      user => 'vagrant',
      build_root => '/home/vagrant/aur-build'
    );

    task_run 'install zef', 'aur-builder', %(
      list => ( 'zef' ),
      user => 'vagrant',
      output => '/tmp/zef'
    );

# Parameters
## list
list of your packages. Required.

## user
A user for building. Default is nobody user.

## build_root
A directory where building will be processed. Default is '/tmp/aur-build'.

## install
If you need to install packages in list when make it `true`. Default is `false`.

## output
Your directory where packages will lying. Default is /tmp.
