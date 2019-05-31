# SYNOPSIS

Manages Linux/UNIX groups


# INSTALL

    $ s6 --install group 


# USAGE


## Manually 


    $ s6 --plg-run group@action=create,name=foo-users

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



