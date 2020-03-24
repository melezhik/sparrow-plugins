# SYNOPSIS

Wrapper for [sqltextify.pl](https://metacpan.org/pod/distribution/Sql-Textify/script/sqltextify.pl)

# INSTALL

    $ s6 --install sqltextify

# USAGE

Cli:

    $ s6 --plg-run sqltextify@args="--conn dbi:SQLite:table.sql --format markdown",sql="select * from a"

Api:

      task-run "users report", "sqltextify", %(
        sql => "select * from a",
        args => [
          %(
            conn => "dbi:SQLite:table.sql",
            format => "markdown"
          )
        ]
      );

See arguments explanation on sqltextify.pl doc pages.

# Plugin maintainer

Alexey Melezhik

