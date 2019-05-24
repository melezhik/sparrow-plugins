# SYNOPSIS

Wrapper for [sqltextify.pl](https://metacpan.org/pod/distribution/Sql-Textify/script/sqltextify.pl)

# INSTALL

    $ s6 --install sqltextify

# USAGE

Runs as task ( prefered way ):

/sqltextify/README
/sqltextify/README
    $ s6 --task-set databases/users

    ---

      sql: select name, email from users
      args:
        - conn: DBI:mysql:database=accounts
        - username: root
        - password: secret123
        - format: markdown
    

    $ s6 --task-run databases/users

Runs as plugin:

    $ s6 --plg-run sqltextify@\
    ,sql='select name, email from users' --\
    --conn DBI:mysql:database=accounts\
    --username root --password secret123

# Plugin maintainer

Alexey Melezhik

