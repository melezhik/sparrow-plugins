# azure-ssl-cert-list

List ssl certificates 

# install

    $ s6 --install azure-ssl-cert-list

# usage

    # list ssl certs for given resource group
    $ sparrow plg run azure-ssl-cert-list --param resource_group=$RG 

    # list ssl certs for given resource group, filtered by thumbprint
    $ sparrow plg run azure-ssl-cert-list --param resource_group=$RG  \
    --param thumbprint=AABBCCDDEEAA00AA

# parameters

## context

Azure context for authentication

## resource_group

Azure resource group

# Requirements

Powershell

# author

Alexey Melezhik


