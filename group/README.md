# SYNOPSIS

Manages Linux/UNIX groups

# INSTALL

    $ s6 --install group 

# USAGE

## Cli

    $ s6 --plg-run group@action=create,name=git # create git group

## Raku

    task-run 'create git group', 'group', %(
        :name<git>,
        :action<create>,
    );

    task-run 'delete git group', 'group', %(                 
        :name<git>,
        :action<delete>,
    );

    my $s = task-run 'check if git group exists', 'group', %(                 
        :name<git>,
        :action<exists>,
    );

    say $s<exists>; # True or False;


# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
