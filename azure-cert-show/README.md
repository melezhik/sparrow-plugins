# SYNOPSIS

Shows essential information of Azure ssl certificate stored in Key Vault.

# INSTALL

    $ sparrow plg install azure-cert-show

# USAGE

CLI:

    # Dump ssl cert named `app-test` in key vault named `myKv100`
    # place certificate into current working directory

    $ sparrow plg run azure-cert-show vault_name=myKv100 --param cert_name=app-test

# Author

Alexey Melezhik

