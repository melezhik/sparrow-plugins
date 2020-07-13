# set-mysql

Simple MySQL setup.

===

Binds a mysql server to "0.0.0.0", create a database and a user (without password),
allows a user full access to a database from a allow_host.


# Install

    s6 --install set-mysql

# Usage

Cli

    s6 --plg-run set-mysql@user=test,database=products,allow_host=192.168.0.1

API

    my %state = task-run "set mysql", "set-mysql", %(
        user => "qa",
        database => "products",
        allow_host => "192.168.0.1"
    );

    if %state<restart> { # configuration's changed we need to restart
      service-restart "mysql"
    }

# Parameters

* `user`

Database user.

* `database`

Database name

* `allow_host`

Host name or IP address

# Platforms supported

Debian/Ubuntu

# Author

Aleksei Melezhik


