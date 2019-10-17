# SYNOPSIS

Check azure keyvault secrets values.

# INSTALL

    $ s6 --install azure-kv-secrets-check-values

# USAGE


    # Check that secrets do NOT have dummy value 

    task-run "check secrets", "azure-kv-secrets-check-values", %(
      name => "kv100", # the name of keyvault
      secrets => ( # these keys should exists
        'password1',
        'password2',
        'db-password1',
        'db-password2'
      ),
      dummy-value => 'changeme'
    )

# Requirements

- az cli
- powershell


# Platforms supported

Linux/Windows

# Author

Alexey Melezhik

