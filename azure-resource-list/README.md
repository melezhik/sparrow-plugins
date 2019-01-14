# azure-resource-list

List Azure resources

# install

    $ sparrow plg install azure-resource-list

# usage

    $ nano .tom/resources-list.pl6

    task-run "set resources list", "azure-resource-list", %(
      group     => "G0"
      pattern  => "foo-bar-baz"
    );

# parameters

## group

Azure resource group

## pattern

Filter for resources names

# Requirements

az cli

# author

Alexey Melezhik


