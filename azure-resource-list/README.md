# azure-resource-list

List Azure resources

# install

    $ sparrow plg install azure-resource-list

# usage


Check resources by pattern

    task-run "set resources list", "azure-resource-list", %(
      group     => "G0"
      pattern  => "foo-bar-baz"
    );


Check resources by list

    task-run "set resources list", "azure-resource-list", %(
      group     => "G0"
      list => [ # these resources should exists in resource group
        'dbserver_dev',
        'dbserver_dev/database_products',
        'strorage_account_01',
        'linux_vm_machine_01',
        'hdi_cluster_dev'
      ]
    )

# parameters

## group

Azure resource group

## pattern

Filter for resources names

## list

Set the list of resources names to check

# Requirements

az cli

# author

Alexey Melezhik


