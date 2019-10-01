# SYNOPSIS

Manages hdi cluster using az cli.

# INSTALL

    $ s6 --install azure-hdi-cluster

# USAGE
 
    # Show cluster info

    task-run "show my cluster", "azure-hdi-cluster", %(
      name    => "cluster01",  # cluster name
      group   => "rg01",       # resource group
    )

    # delete cluster
    task-run "delete cluster", "azure-hdi-cluster", %(
      name    => "cluster01",  # cluster name
      group   => "rg01",       # resource group
      action  => "delete"
    )

# Parametes

## name

cluster name

## group

Azure resource group

## action

`show|delete`, default value is `show`

* `show` - show cluster provision state

* `detete` - delete cluster

## state

default value is `Succeeded`

Check if provision state, for example:

    task-run "show my cluster", "azure-hdi-cluster", %(
      name    => "cluster01",  # cluster name
      group   => "rg01",       # resource group
      state   => Failed"
    )


# Requirements

az cli 

# Platforms supported

* Windows

# Author

Alexey Melezhik

