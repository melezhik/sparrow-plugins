# SYNOPSIS

Split nagios config by hosts and save found hosts configurations to distinct files.

The author of original awk script is [Akshay Hegde](https://stackoverflow.com/users/3161993/akshay-hegde)
the code is taken from [StackOverflow](https://stackoverflow.com/a/46197347/5147708).


# INSTALL

    $ s6 --install nagios-split-host

# USAGE

Parse nagios config given by `file`, find distinct hosts blocks and save them separately into `dest` dir:

    $ s6 --plg-run nagios-split-host@\
    --format concise  # to strip reports lines\
    ,file=/path/to/ngios/conf\
    ,dest=/path/to/destination/dir


# Plugin maintainer

Alexey Melezhik

# Prerequisites

Awk should be installed


