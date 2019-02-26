# SYNOPSIS

Simple wrapper around Azure key vault secret show command, with multiple secrets / url notation support.

# INSTALL

    $ sparrow plg install azure-kv-show

# USAGE

Tomtit/Sparrowdo

    # Show single secret

    task-run "show me your secret", "azure-kv-show", %(
      kv      => "Stash" # key vault name
      secret  => "password"  # secret name
    )

    # Show many secret

    task-run "show me your secrets", "azure-kv-show", %(
      kv      => "Stash" # key vault name
      secret  => ( "password", "login" ) # secret names
    )

Controlling output format:

    view => "table" # dump in table format

By default output format is line by line.

Sparrow cli:

    # Dump secret `password` of key vault ID `Stash`

    $ sparrow plg run azure-kv-show --param kv=Stash --param secret=password


    # Dump secret's value by key vault URL 

    $ sparrow plg run azure-kv-show --param url={key vault url}

# Requirements

az cli 

# Author

Alexey Melezhik

