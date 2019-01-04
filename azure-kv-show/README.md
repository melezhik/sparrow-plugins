# SYNOPSIS

Simple wrapper around Azure key vault secret show command. 

Basically for easy/fast access to your popular key vault secrets.

Just because I am to "lazy" to remember various `az cli` commands syntax.

# INSTALL

    $ sparrow plg install azure-kv-show

# USAGE

Tomtit/Sparrowdo

    # Show single secret

    task-run "show me your secret", "azure-kv-show", %(
      kv      => "Stash" # key vault name
      secret  => "password"  # secret name
    )

Sparrow cli:

    # Dump secret `password` of key vault ID `Stash`

    $ sparrow plg run azure-kv-show --param kv=Stash --param secret=password


    # Dump secret's value by key vault URL 

    $ sparrow plg run azure-kv-show --param url={key vault url}

# Requirements

az cli 

# Author

Alexey Melezhik

