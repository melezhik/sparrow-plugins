# azure-deploy-arm

Deploy ARM template

# install

    $ s6 --install azure-deploy-arm

# usage

    $ s6 --plg-run azure-deploy-arm@\
    ,resource_group=$RG\
    ,path=C:\tmp\resources.json

# parameters

## context

Azure context for authentication

## resource_group

Azure resource group

## path

Path to template

# Requirements

Powershell

# author

Alexey Melezhik


