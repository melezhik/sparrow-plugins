# SYNOPSIS

Simple wrapper around Azure key vault secret show command. Basically for easy/fast access to your popular key vault secrets.
Just because I am to "lazy" to remember various `az cli` commands syntax.

# INSTALL

    $ sparrow plg install azure-kv-show

# USAGE

CLI:

    # Dump secret `password` of key vault ID `Storage`
    # place certificate into current working directory

    $ sparrow plg run azure-kv-show --param kv=Storage --param sec=password

Key vault syntax:

    $ sparrow plg run azure-kv-show --param url={key vault url}

Sparrow task:

    $ sparrow project create az-kv
    $ sparrow task add az-kv db-pass azure-kv-show
    $ sparrow task ini az-kv/db-pass

    kv: Storage
    sec: password

    $ sparrow task run az-kv/db-pass


# Author

Alexey Melezhik

