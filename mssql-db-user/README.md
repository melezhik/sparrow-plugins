# SYNOPSIS

Creates mssql user and grants permissions for database.

# Install

    $ s6 --install mssql-db-user

# USAGE

## Using sparrow plugin

    # create user with login and password
    # and grant permissions to databases

    $ sparrow plg run mssql-db-user \
      --param db_server={mssql server host} \
      --param db_admin={database server admin login} \
      --param db_pass={database server admin password} \
      --param db_name={database name to grant access to} \
      --param db_user={user login}
      --param db_user_pass={user password}


    # only check that your db admin creds are valid

    $ sparrow plg run mssql-db-user \
      --param db_server={mssql server host} \
      --param db_admin={database server admin login} \
      --param db_pass={database server admin password} \
      --param check_connection=on

# Using sparrow task


    $ sparrow project create databases
    $ sparrow task add databases create-login mssql-db-user
    $ sparrow task ini databases/create-login

    db_admin: {database server admin login}
    db_pass: {database server admin login}
    db_server: {mssql server host}

    db_name: {database name to grant access to} 
    db_user: {user login}
    db_user_pass: {user password}

    check_connection: off

    $ sparrow task run databases/create-login
    
# Prerequisites

* sqlcmd client 

# Author

Alexey Melezhik

