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


# Requirements

az cli 

# Platforms supported

* Windows

# Author

Alexey Melezhik

