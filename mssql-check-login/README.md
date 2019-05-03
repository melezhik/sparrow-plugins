# SYNOPSIS

Simple login checker based on sqlcmd utility

# Install

    $ s6 --install mssql-check-login

# USAGE

    # check if login and password are valid
    # creds passed through dsn 
    $ sparrow plg run mssql-check-login --param dsn={dsn in MSSQL format}

    # check if login and password are valid
    # creds passed as is
    $ sparrow plg run mssql-check-login --param user={login} --param pass={password} --param db_host={data base host} --param dbname={database name}

# Prerequisites

* sqlcmd client 

# Author

Alexey Melezhik

