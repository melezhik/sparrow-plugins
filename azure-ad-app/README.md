# SYNOPSIS

Get info for Azure ad app.

# Why

Because it makes my life simpler.

# INSTALL

    $ s6 --install azure-ad-app

# Prerequisites

* az cli

# USAGE

    # Get appId for application with displayName

    my %s = task-run "get app", "azure-ad-app", %(
      displayName => "app-dev", # application registered displayName
    );

    say %s<appId>; # get appId

    say %s.perl; # get other app properites as Raku Hash

# Parameters

## displayName

Application registered displayName

# Author

Alexey Melezhik
