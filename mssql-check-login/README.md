# SYNOPSIS

Simple login checker based on sqlcmd utility

# Install

    $ s6 --install mssql-check-login

# USAGE

    # check if login and password are valid
    # creds passed through dsn 
    $ s6 --plg-run mssql-check-login@dsn={dsn in MSSQL format}

    # check if login and password are valid
    # creds passed as is
    $ s6 --plg-run mssql-check-login@user={login},pass={password},db_host={data base host},dbname={database name}

# Prerequisites

* sqlcmd client 

# Author

Alexey Melezhik

