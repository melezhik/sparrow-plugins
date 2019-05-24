# azure-list-context

List locally saved azure contexts

# Install

    $ s6 --install azure-list-context

# Usage

    $ s6 --plg-run azure-list-context

# Parameters

## search

Filter out by account name

    $ s6 --plg-run azure-list-context@search=Dev

# Requirements

Powershell

# Author

Alexey Melezhik

# See also 

[Persist user credentials across PowerShell sessions](https://docs.microsoft.com/en-us/powershell/azure/context-persistence?view=azurermps-6.12.0)
