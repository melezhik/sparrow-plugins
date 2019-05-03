# azure-account-set

Set Azure account

# install

    $ s6 --install azure-account-set

# usage

    $ nano .tom/set-acount.pl6

    task-run "set az account", "azure-account-set" %(
      subscription  => "foo-bar-baz"
    );

# parameters

## subscription

Azure subscription

# Requirements

az cli

# author

Alexey Melezhik


