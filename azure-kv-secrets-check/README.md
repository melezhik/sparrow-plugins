# SYNOPSIS

Check azure keyvault secrets.

# INSTALL

    $ s6 --install azure-kv-secrets-check

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

# Platforms supported

Linux/Windows

# Author

Alexey Melezhik

