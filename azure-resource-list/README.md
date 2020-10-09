# azure-resource-list

List Azure resources

# install

    $ s6 --install azure-resource-list

# usage


Check resources by pattern

    my %state = task-run "get resources list", "azure-resource-list", %(
      group     => "G0"
      pattern  => "foo-bar-baz"
    );


Check resources by list

    my %state = task-run "get resources list", "azure-resource-list", %(
      group     => "G0",
      list => [ # these resources should exists in resource group
        'adf001@Microsoft.DataFactory/factories',
        'hdi002@Microsoft.HDInsight/clusters',
        'db003/master@Microsoft.Sql/servers/databases',
        'storarge004@Microsoft.Storage/storageAccounts',
      ]
    )

# state

The returned state has a list of Azure Resources Names

    {
      list => [
        'foo',
        'bar',
        'baz'
      ]
    }


# parameters

## group

Azure resource group

## pattern

Raku regexp. Filter for resources names, for example:

    foo || bar # foo or bar

## list

Set the list of resources names to check.

Every element is the list is in format:

    resource-name@resource-type

Or if  to check only resource types:

    resource-type

For example:

    (
      "Microsoft.Sql/servers/databases",
      "Microsoft.Storage/storageAccounts",
    )

# Requirements

az cli

# author

Alexey Melezhik


