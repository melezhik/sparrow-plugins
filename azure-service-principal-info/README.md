# azure-service-principal-info

Get info about service principal

# install

    $ s6 --install azure-service-principal-info

# usage

    # Get service principal by Id
    $ sparrow plg run azure-service-principal-info \
    --param id=$id

Example:


    $ sparrow plg run azure-service-principal-info --param id=572ef3ea-981d-3415-a4c3-afc369122434


# parameters

## context

Azure context for authentication

## id

Id

# Requirements

Powershell

# author

Alexey Melezhik


