# SYNOPSIS

Sparrow plugin to manages directories.


# INSTALL


    $ s6 --install directory


# USAGE


    $ cat sparrowfile


    task-run %(

      task => 'create this directory',
      plugin => 'directory',
      parameters => %(
        action => 'create',
        path => '/opts/perl'
        recursive => 1,
        mode => '755',
        owner => 'sparrow',
        group => 'sparrow'
      )

    );


# Parameters

## action

One of two - `create|delete`. Default value is 'create'

## path

A directory path.

## recursive

Recursively creates a directory if parent directories not exist. Default value is 1.

## owner

Sets the owner of the directory created

## group

Sets a group a directory created will belong to

## mode

Sets file permissions

# OS supported

* Linux
* Windows

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
