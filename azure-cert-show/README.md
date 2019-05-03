# SYNOPSIS

Shows essential information of Azure ssl certificate stored in Key Vault.

# INSTALL

    $ s6 --install azure-cert-show

# USAGE

CLI:

    # Show some attributes for ssl cert named `app-test` in key vault named `myKv100`

    $ sparrow plg run azure-cert-show \
    --param vault_name=myKv100 --param cert_name=app-test

# Match thumbprint

If you need to compare some thumbprint to the one from certificate, use `check_thumbprint` parameter:

    $ sparrow plg run azure-cert-show \
    --param vault_name=myKv100 \
    --param cert_name=app-test \
    --check_thumbprint=1C7E732A567A4DA61195FF80DXX284FD3F84AE0

In case certifcate's thumbprint does not equal to the passed one, plugin will generates error.

# Author

Alexey Melezhik

