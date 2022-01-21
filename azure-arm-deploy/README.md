# SYNOPSIS

Simple wrapper for az group deployment command.

# Why

Because it makes my life simpler.

# INSTALL

    $ s6 --install azure-arm-deploy

# Prerequisites

* az cli

# USAGE

    # Deploy, pass parameters from file
    task-run "deploy", "azure-arm-deploy", %(
      group => "rg01", # azure resource group
      template => "/path/to/template.json", # ARM/Bicep template
      parameters => "/path/to/params.json", # parameters file
    );

    # Deploy, pass parameters as Raku Hash

    task-run "deploy", "azure-arm-deploy", %(
      group => "assmt-dev",
      template => "bicep/appservice.bicep",
      parameters => {
        sku => { value => "P1v2" },
        webSiteName => { value => "appraku111" },
        appServicePlanName => { value => "assmt-dev" },
        linuxFxVersion => { value => "PYTHON|3.9" }
      },
      verbose => True,
    );

    # Restart Azure app service upon successful deployment:

    task-run "deploy and restart", "azure-arm-deploy", %(
      group => "rg01", # azure resource group
      name => "dpl0",
      template => "/path/to/template.json", # ARM/Bicep template
      parameters => "/path/to/params.json", # parameters
      app_service => "web-app", # Azure app service name
      app_service_restart => True, # restart app service
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

`create|validate`. Default value is `create` - create deployment.

Choose `validate` to only validate deployment.

## verbose

Bool. `(True|False)`

Set `--verbose` flag when invoke `az cli`. Default value is `False` ( do not set ).

# Author

Alexey Melezhik
