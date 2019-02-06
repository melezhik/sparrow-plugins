# SYNOPSIS

Manages Linux/UNIX groups


# INSTALL

    $ sparrow plg install group 


# USAGE


## Manually 


    $ sparrow plg run group --param action=create --param name=foo-users

## Sparrowdo

    $ cat sparrowfile

    use v6;

    use Sparrowdo;

    task_run %(
      task => 'create foo group',
      plugin => 'group',
      parameters => %(
        name => 'foo',
        action => 'create'
      )
      
    );

    task_run %(
      task => 'remove baz group',
      plugin => 'group',
      parameters => %(
        name => 'baz',
        action => 'delete'
      )
      
    );

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)



