# SYNOPSIS

Dump azure app service application settings

# INSTALL

    $ sparrow plg install azure-web-app-appsettings

# USAGE

CLI:

    # Dump settings for app service `webApp`
    # Resource group `myGroup`
    # place certificate into current working directory

    $ sparrow plg run azure-web-app-appsettings --param app_service=webApp --param group=myGroup

# Parameters
  
## app_service

Azure app service name.

## group

Azure resource group name.

# Author

Alexey Melezhik

