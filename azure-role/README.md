# SYNOPSIS

Manages Azure roles assignments.

# Why

Because it makes my life simpler.

# INSTALL

    $ s6 --install azure-role

# Prerequisites

* az cli

# USAGE

    # Assing appId as Contributor to a resource group Rg1

    my %s = task-run "assign", "azure-role", %(
      appId => "*16*6c0f-****-****-8bb6-f*f5f34685*c", # application ID
      group => "Rg1", # resource group name,
      role => "Contributor" 
    );


# Parameters

## appId

Application registered ID

## group 

Azure resource group

## role

Azure role name. Optional, default value is `Contributor`


# Limitations

Now only role assignments for resource groups are supported

# Author

Alexey Melezhik
