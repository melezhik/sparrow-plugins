# SYNOPSIS

Simple wrapper around Azure key vault secret show command, with multiple secrets / url notation support.

# INSTALL

    $ s6 --install azure-kv-show

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

    $ s6 --plg-run azure-kv-show@kv=Stash,secret=password


    # Dump secret's value by key vault URL 

    $ s6 --plg-run azure-kv-show@url={key vault url}

# state

The returned state has a Hash of key vault secrets

    {
      "password" => "Qwerty123",
      "login" => "admin"
    }

# Requirements

az cli 

# Author

Alexey Melezhik

