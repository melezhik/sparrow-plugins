# SYNOPSIS

Simple wrapper for az group deployment command. 

Because it makes my life simpler.

# INSTALL

    $ s6 --install azure-arm-deploy

# Prerequisites

* az cli

# USAGE

It is mostly designed to run through sparrowdo, so:

    #!perl6
    
    my $templ-file = "{config<templ-dir>}/azuredeploy.json";
    my $templ-params-file = "{config<params-dir>}/azuredeploy.parameters.{config<env>}.json";
    
    task-run "deploy azure resources", "azure-arm-deploy", %(
      group => config<resource-group>, # azure resource group
      template => $templ-file, # ARM template
      parameters => $templ-params-file, # ARM parameters
      mode => "create" # default value
    );
    

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

# Restarting app service

To restart Azure app service upon successful deployment:

    task-run "deploy azure resources", "azure-arm-deploy", %(
      group => config<resource-group>, # azure resource group
      template => $templ-file, # ARM template
      parameters => $templ-params-file, # ARM parameters
      mode => "create", # default value
      app_service => "web-app", # Azure app service name
      app_service_restart => "on", # ask to restart app service
    );

# Author

Alexey Melezhik

