# azure-ssl-bind-list

List ssl bindings for web application

# install

    $ s6 --install azure-ssl-bind-list

# usage

    # list ssl certs for given resource group
    $ sparrow plg run azure-ssl-bind-list \
    --param resource_group=$RG \
    --param app_service=$app_service

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


