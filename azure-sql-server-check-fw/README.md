# SYNOPSIS

Check firewall rules for azure sql database server.


# INSTALL

    $ s6 --install azure-sql-server-check-fw

# USAGE

Tomtit/Sparrowdo

    task-run "check acls", "azure-sql-server-check-fw", %(
      name => "dbtest" # the name of sql server resource,
      group => "grp01", # azure resource group
      allow => [ # allowed ip addresses 
        ["192.168.0.0", "192.168.0.0.255"],
        ["0.0.0.0", "0.0.0.0"],
      ]
    )

# Requirements

az cli

# Author

Alexey Melezhik

