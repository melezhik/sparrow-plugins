# azure-service-principal-info

Get info about service principal

# install

    $ s6 --install azure-service-principal-info

# usage

    # Get service principal by Id
    $ s6 --plg-run azure-service-principal-info@\
    ,id=$id

Example:


    $ s6 --plg-run azure-service-principal-info@id=572ef3ea-981d-3415-a4c3-afc369122434


# parameters

## context

Azure context for authentication

## id

Id

# Requirements

Powershell

# author

Alexey Melezhik


