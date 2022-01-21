# SYNOPSIS

Simple wrapper for az group deployment command. 

Because it makes my life simpler.

# INSTALL

    $ s6 --install azure-arm-deploy

# Prerequisites

* az cli

# USAGE

    task-run "deploy", "azure-arm-deploy", %(
      group => "rg01", # azure resource group
      template => "/path/to/template.json", # ARM/Bicep template
      parameters => "/path/to/params.json", # parameters file
    );

# Parameters

## group

Azure resource group. Required.

## name

Azure deployment name. Optional. Default value `dpl01`.

## template

Path to ARM template | Bicep file. Required.

## parameters

Path to parameters file | Raku Hash. Required.

## mode

`create|validate`. Default value is `create` - create deployment. Choose `validate` to only validate 
deployment.

## verbose

`(on|off)`

Set `--verbose` flag when invoke `az cli`. Default value is `off` ( do not set ).

# Restarting app service

To restart Azure app service upon successful deployment:

    task-run "deploy and restart", "azure-arm-deploy", %(
      group => "rg01", # azure resource group
      name => "dpl0",
      template => "/path/to/template.json", # ARM/Bicep template
      parameters => "/path/to/params.json", # parameters
      app_service => "web-app", # Azure app service name
      app_service_restart => "on", # restart app service
    );

# Pass parameters as Raku Hash

    task-run "deploy", "azure-arm-deploy", %(
      group => "assmt-dev",
      template => "bicep/appservice.bicep",
      parameters => {
        webSiteName => { value => "appraku111" },
        appServicePlanName => { value => "assmt-dev" },
      },
      mode => "create" # default value
    );

# Author

Alexey Melezhik

