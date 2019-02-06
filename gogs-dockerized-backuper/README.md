# SYNOPSIS

Outthentic plugin.

Backup your repositories in dockerized gogs via sparrow/sparrowdo.

# INSTALL

    $ sparrow plg install gogs-dockerized-backuper

# USAGE

## via Sparrowdo

    $ cat sparrowfile

    task-run "test backup", "gogs-dockerized-backuper", %(
      docker => %(
        name => 'gogs_gogs_1'
      ),
      destination => '/home/vagrant/backup'
    );

# Parameters

## destination
Destination for backup archive. Required. Default is /tmp

## docker settings
### name
Name for instance of gogs. Required.

# See also
[sparrowdo](https://github.com/melezhik/sparrowdo)

[sparrow](https://github.com/melezhik/sparrow)

[project gogs on github](https://github.com/gogits/gogs)
