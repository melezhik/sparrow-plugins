# SYNOPSIS

Login to Auzure using az cli.

# INSTALL

    $ s6 --install azure-login

# USAGE
 
    # Login using app registration principal

    task-run "login to azure", "azure-login", %(
        tenant    => config()<azure><tenant>, # Azure Tenant ID
        app_reg   => config()<azure><app-reg>, # Application registration URL
        password  => config()<azure><password>, # Password ( AKA client secret )
        subs      => config()<azure><subscription> # Subscription ( name or id )
    )


# Requirements

az cli 

# Platforms supported

* Linux
* Windows

# Author

Alexey Melezhik

