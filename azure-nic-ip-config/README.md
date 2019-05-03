# azure-nic-ip-config

Show ip configuration for network interface

# install

    $ s6 --install azure-nic-ip-config

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

## nic_name

Network interface name

# Requirements

az cli

# author

Alexey Melezhik


