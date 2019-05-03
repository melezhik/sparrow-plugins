# SYNOPSIS

A simple setup for nano rc file

# INSTALL

    $ s6 --install nano-setup 

# USAGE

## Manually

    # use default settings , apply for current user    
    $ sparrow plg run 


    # override settings, apply for some user    
    $ sparrow plg run --param tabsize=2 --param user=melezhik
         
    # sets other parameter explicitly
    $ sparrow plg run --param tabsize=2 --param speller='hunspell -x -c'

## Sparrowdo usage
    
    $ cat sparrowfile

    
    task_run  %(
      task => 'set my nano rc up',
      plugin => 'nano-setup',
      parameters => %( 
        tabsize => 2,
        user => 'foo'
      )
    );
        

# Parameters

## tabsize

The size of tab in spaces. Default value is `2`.

## user

A Linux user name. Choose this if you want to set up nano for some user.

## speller

A nano speller command. Optional. Default value is `hunspell -x -c`.


# AUTHOR

[Alexey Melezhik](mailto:gmail.com)


