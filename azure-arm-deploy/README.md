# SYNOPSIS

Simple wrapper for az deployment command.

# Why

Because it makes my life simpler.

# INSTALL

    $ s6 --install azure-arm-deploy

# Prerequisites

* az cli

# USAGE

    # Group deploy, ARM parameters passed as Raku Hash

    task-run "deploy", "azure-arm-deploy", %(
      name => "VMs", # deployment name, optional
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

    # Group deployment, ARM parameters passed from from file

    task-run "deploy", "azure-arm-deploy", %(
      group => "rg01", # azure resource group
      template => "/path/to/template.json", # ARM/Bicep template
      parameters => "/path/to/params.json", # ARM parameters file
    );

    # Restart Azure app service upon successful deployment:

    task-run "deploy and restart", "azure-arm-deploy", %(
      name => "webapp", # deployment name, optional
      group => "rg01", # azure resource group
      template => "/path/to/template.json", # ARM/Bicep template
      parameters => "/path/to/params.json", # parameters
      app_service => "web-app", # Azure app service name
      app_service_restart => True, # restart app service
    );

    # Subscrption deployment, resource group
    task-run "deploy", "azure-arm-deploy", %(
      subgroup => "sub",  # we deploy into a subscription
      location => "eastus2", # subscription deployment needs a location
      template => "bicep/rg.bicep",
      parameters => { # ARM parameters for template
        groupName => { value => "RG01" },
        groupLocation => { value => "eastus2" },
      },
    );

# Parameters

## suboup

Deployment subgroup. `group|sub`, optional, default value is `group` ( corresponds resource group deployment )

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
