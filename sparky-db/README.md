# SYNOPSIS

Utility to manipulate Sparky SQLite DB.

So far it's juts builds list. More action will be added eventually.

# INSTALL

    $ s6 --install sparky-db

# USAGE

Cli

    # with default settings    
    $ s6 --plg-run sparky-db

    # override default settings    
    $ s6 --plg-run sparky-db@db=/path/to/sparky/db.sqlite3,max=1000

# Parameters

* `db`

Database sqlite file path. Optional. Default value is $HOME/.sparky/projects/db.sqlite3

* `max` 

Max records to fetch. Default value is `10`

# Platforms supported

* Linux

* MacOS

# Requirements

None. It's built on Go, all dependencies are statically included.

# Author

Alexey Melezhik
