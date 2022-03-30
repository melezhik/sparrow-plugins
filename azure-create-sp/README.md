# azure-create-sp

Create azure service principle and grant contributor permission to resource group

# Install

    s6 --install azure-create-sp

# Usage

    my %state = task-run "create", "azure-create-sp", %(
      name => "sp_ci",
      rg => "my resource group",
      subscription => "12345678",
    );

    say %state<appId>;
    say %state<password>;

# Parameters

## name

Service principal name

## subscription

Azure subscription

## rg

Azure resource group name


# Author

Aleksei Melezhik


