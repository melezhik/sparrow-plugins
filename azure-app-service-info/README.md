# azure-app-service-info

Shows info for Azure app service

# install

    $ s6 --install azure-app-service-info

# usage

    $ s6 --plg-run azure-app-service-info@resource_group=$RG,app_service=$AppServiceName,context=Dev

# parameters

## context

Azure context for authentication

## resource_group

Azure resource group

## app_service

Azure app service name

# Requirements

Powershell

# author

Alexey Melezhik


