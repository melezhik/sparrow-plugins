# SYNOPSIS

Simple file manager.

# INSTALL

    $ s6 --install file

# USAGE

## Manually

    $ s6 --plg-run file@\
    ,target=/tmp/foo-bar.txt\
    ,content=hello-world\
    ,owner=melezhik\
    ,group=users

## Via sparrowdo

    $ cat sparrowfile
  
    task_run %(
      task    => 'create file',
      plugin  => 'file',
      parameters => %(
        action  => 'create',
        owner   => 'Bill',
        group   => 'Users',
        mode    => '644',
        target  => '/etc/bill/hello.txt'
        content => 'hello Bill!'
      )
    );

    task_run %(
      task    => 'delete file',
      plugin  => 'file',
      parameters => %(
        action  => 'delete',
        target  => '/etc/bill/hello.txt'
    )

# Parameters

## action

One of two - `create|delete`. Default value is 'create'. Should be set.

## source 

If source is set then copy `source` into `target`. Source should be file path. No default value. Optional.

## target

A file path being created or removed. No default value. Obligatory.

## mode

Sets a file mode for the target. Default value is `644`. Optional.

## owner

Sets a target ownership to owner. No default value. Optional.

## group

Sets a target group to group. No default value. Optional.

## content

A file content. No default value. Optional. If a `content` is set then `source` parameter gets ignored.

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)


