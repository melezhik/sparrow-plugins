# azure-authenticate

Authenticate to Azure using service principal and save authentication data as a context

# Install

    $ s6 --install azure-authenticate

# Usage

    $ s6 --plg-run azure-authenticate@\
    ,client_id=$ClientId\
    ,tenant_id=$TenantId\
    ,context=DevAndTest

# Parameters

## client_id

Server principal client ID

## tenant_id

Server principal tenant ID

## context

Context name

# Requirements

Powershell
  
# Author

Alexey Melezhik

# See also 

[Persist user credentials across PowerShell sessions](https://docs.microsoft.com/en-us/powershell/azure/context-persistence?view=azurermps-6.12.0)
