# azure-dls-account-list

List azure datalake storage accounts 

# install

    $ s6 --install azure-dls-account-list

# usage

    $ nano .tom/dls-accounts.pl6

    task-run "list dls accounts - G0", "azure-dls-account-list", %(
      group     => "G0"
    );

# parameters

## group

Azure resource group

# Requirements

az cli

# author

Alexey Melezhik


