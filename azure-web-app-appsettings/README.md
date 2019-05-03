# SYNOPSIS

Dump/Validate azure app service application settings.

# INSTALL

    $ s6 --install azure-web-app-appsettings

# USAGE

CLI:

    # Dump settings for app service `webApp`
    # Resource group `myGroup`
    # place certificate into current working directory

    $ sparrow plg run azure-web-app-appsettings --param app_service=webApp --param group=myGroup

Sparrow task

    $ sparrow project create azure
    $ sparrow project task add azure webapp-settings azure-web-app-appsettings
    $ sparrow task ini azure webapp-settings

    group: myGroup
    app_service: webApp

# Parameters
  
## app_service

Azure app service name.

## group

Azure resource group name.

# Check required settings

You may check if certain settings exists in application settings, by setting `required_settings` array:

    $ sparrow task ini azure webapp-settings

    group: myGroup
    app_service: webApp

    required_settings:
      - database_host
      - database_name
      - database_login
      - database_password

# Author

Alexey Melezhik

