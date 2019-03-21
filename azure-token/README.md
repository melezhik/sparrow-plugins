# SYNOPSIS

Get azure token for service principal.

# INSTALL

    $ sparrow plg install azure-token

# USAGE

Tomtit/Sparrowdo

    my %state = task-run "get-token", "azure-token", %(
      tenant_id => "1oo-2ar-3az",
      client_id => "foo-bar-baz",
      client_secret => "paSworRdd"
    );

    say %state<token>;

# Requirements

az cli

# Author

Alexey Melezhik

