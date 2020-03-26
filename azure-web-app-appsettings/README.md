# SYNOPSIS

Dump/Validate azure app service application settings.

# INSTALL

    $ s6 --install azure-web-app-appsettings

# USAGE

Cli:

    # Dump settings for app service `webApp`
    # Resource group `myGroup`
    # place certificate into current working directory

    $ s6 --plg-run azure-web-app-appsettings@app_service=webApp,group=myGroup

Api:

    task-run "dump app settings", "azure-web-app-appsettings", %(
      group => "myResourceGroup",
      app_service => "webApp"
    )

# Parameters
  
## app_service

Azure app service name.

## group

Azure resource group name.

# Check required settings

To verify that settings are set choose `required_settings`.

Split by '/' if use cli:

    $ s6 --plg-run azure-web-app-appsettings@app_service=webApp,group=myGroup,\
    required_settings=database_host/database_name/database_login/database_password

Or pass as array if use API:

    task-run "dump app settings", "azure-web-app-appsettings", %(
      group => "myResourceGroup",
      app_service => "webApp",
      required_settings => [
          "database_host",
          "database_name",
          "database_login",
          "database_password"
        ]
    )


# Prerequisites

* Perl/JSON module

I am going to replace by pure Raku soon.

# Author

Alexey Melezhik

