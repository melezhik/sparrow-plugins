# azure-resource-list

List Azure resources

# install

    $ sparrow plg install azure-resource-list

# usage


Check resources by pattern

    task-run "get resources list", "azure-resource-list", %(
      group     => "G0"
      pattern  => "foo-bar-baz"
    );


Check resources by list

    task-run "get resources list", "azure-resource-list", %(
      group     => "G0"
      list => [ # these resources should exists in resource group
        'adf001@Microsoft.DataFactory/factories',
        'hdi002@Microsoft.HDInsight/clusters',
        'db003/master@Microsoft.Sql/servers/databases'
        'storarge004@Microsoft.Storage/storageAccounts',
      ]
    )

# parameters

## group

Azure resource group

## pattern

Perl5 regexp. Filter for resources names

## list

Set the list of resources names to check.

Every element is the list is in format:

    resource-name@resource-type

# Requirements

az cli

# author

Alexey Melezhik


