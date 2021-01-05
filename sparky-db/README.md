# SYNOPSIS

Utility to manipulate Sparky SQLite DB.

So far it's juts builds list. More action will be added eventually.

# INSTALL

    $ s6 --install sparky-db

# USAGE

Cli

    $ s6 --plg-run sparky-db # default database path

    $ s6 --plg-run sparky-db@db=/path/to/sparky/db.sqlite3 # custom database path

# Parameters

* `db`

Database sqlite file path. Optional. Default value is `$HOME/.sparky/projects/db.sqlite3`

# Platforms supported

* Linux
* MacOS

# Requirements

None. It's built on Go, all dependencies are statically included.

# Author

Alexey Melezhik
