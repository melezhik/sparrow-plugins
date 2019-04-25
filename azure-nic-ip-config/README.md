# azure-nic-ip-config

Show ip configuration for network interface

# install

    $ sparrow plg install azure-nic-ip-config

# usage


Check io configuration info for NIC in resource group

    task-run "get ip configuration", "azure-nic-ip-config", %(
      group     => "G0"
      nic_name  => "foo-bar-baz"
    );


# state

The returned state has a ip configuration properties

    {

      "privateIpAddress" => "10.01.21.25",

      "subnet": {
        "addressPrefix": null,
        "addressPrefixes": null,
        "delegations": null,
        "etag": null
      }

      // and so on

    }


# parameters

## group

Azure resource group

## pattern

Perl5 regexp. Filter for resources names, for example:

    `foo|bar` # foo or bar

## list

Set the list of resources names to check.

Every element is the list is in format:

    resource-name@resource-type

# Requirements

az cli

# author

Alexey Melezhik


