# azure-ssl-bind-list

List ssl bindings for web application

# install

    $ s6 --install azure-ssl-bind-list

# usage

    # list ssl certs for given resource group
    $ s6 --plg-run azure-ssl-bind-list@\
    ,resource_group=$RG\
    ,app_service=$app_service

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


