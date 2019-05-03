# SYNOPSIS

Wrapper for [sqltextify.pl](https://metacpan.org/pod/distribution/Sql-Textify/script/sqltextify.pl)

# INSTALL

    $ s6 --install sqltextify

# USAGE

Runs as task ( prefered way ):

    $ sparrow project create databases
    $ sparrow task add databases users sqltextify
    $ sparrow task ini databases/users

    ---

      sql: select name, email from users
      args:
        - conn: DBI:mysql:database=accounts
        - username: root
        - password: secret123
        - format: markdown
    

    $ sparrow task run databases/users

Runs as plugin:

    $ sparrow plg run sqltextify \
    --param sql='select name, email from users' -- \
    --conn DBI:mysql:database=accounts \
    --username root --password secret123

# Plugin maintainer

Alexey Melezhik

