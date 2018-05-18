# SYNOPSIS

Simple wrapper for az group deployment command. 

Because it makes my life simpler.

# INSTALL

    $ sparrow plg install azure-arm-deploy

# Prerequisites

* az cli

# USAGE

    $ sparrow project create azure
    $ sparrow task add azure/app-deploy azure-arm-deploy
    $ sparrow task ini azure/app-deploy

    group: my-azure-resource-group
    template: /path/to/file/with/arm/template.json 
    parameters: /path/to/file/with/arm/parameters.json  
    # mode should be one of: validate|create
    mode: create 

    $ sparrow task run azure/app-deploy

# Parameters

## group

Azure resource group

## template

Path to ARM template file

## parameters

Path to ARM parameters file

## verbose

`(on|off)`

Set `--verbose` flag when invoke `az cli`. Default value is `off` ( do not set ).

# Author

Alexey Melezhik

