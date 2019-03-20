# SYNOPSIS

Check azure keyvault secrets.

# INSTALL

    $ sparrow plg install azure-kv-secrets-check

# USAGE

Tomtit/Sparrowdo

    task-run "check secrets", "azure-kv-secrets-check", %(
      name => "kv100", # the name of keyvault
      exists => [ # these keys should exists
        'password1',
        'password2',
        'db-password1',
        'db-password2'
      ]
    )

# Requirements

az cli

# Author

Alexey Melezhik

