# SYNOPSIS

Creates mssql user and grants permissions for database.

# Install

    $ s6 --install mssql-db-user

# USAGE

## Using sparrow plugin

    # create user with login and password
    # and grant permissions to databases

    $ s6 --plg-run mssql-db-user@\
    ,db_server={mssql server host}\
    ,db_admin={database server admin login}\
    ,db_pass={database server admin password}\
    ,db_name={database name to grant access to}\
    ,db_user={user login}
    ,db_user_pass={user password}


    # only check that your db admin creds are valid

    $ s6 --plg-run mssql-db-user@\
    ,db_server={mssql server host}\
    ,db_admin={database server admin login}\
    ,db_pass={database server admin password}\
    ,check_connection=on

# Using sparrow task


/mssql-db-user/README
/mssql-db-user/README
    $ s6 --task-set databases/create-login

    db_admin: {database server admin login}
    db_pass: {database server admin login}
    db_server: {mssql server host}

    db_name: {database name to grant access to} 
    db_user: {user login}
    db_user_pass: {user password}

    check_connection: off

    $ s6 --task-run databases/create-login
    
# Prerequisites

* sqlcmd client 

# Author

Alexey Melezhik

