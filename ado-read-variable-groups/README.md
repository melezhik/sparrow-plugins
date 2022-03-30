# SYNOPSIS

Get/Print Ado variable group.

# INSTALL

    $ s6 --install ado-read-variable-groups

# USAGE

    task-run "read my vars", "ado-read-variable-groups", %(
      project => "CoolKids",
      name => "funky_vars",
    );

# State

Returns a list of variables:

    my %state = task-run "read my vars", "ado-read-variable-groups", %(
      project => "CoolKids"
      name => "funky_vars",
    );

    for %state<list><> -> $i {

      say "{$i<name>} = {$i<value>}";

    }

# Parameters

## project

Ado project name. Required.

## name

  Variable group name. Required.

## only

Get only selected variables. Optional.

For example:

  only => ( 'login', 'password' ) # login and password variables only

## debug

Enable debug mode. Optional. Default value is false.

# Authentication

Create file named `~/.sparrow-azure-devops.sh`

```
token=$PAT
api=https://dev.azure.com/$organization
user=$api_user
```

Where:

* `user`

User to sign requests

* `token`

User personal access token (PAT)

* `api`

Azure DevOps API URL

# Requirements

curl

# Author

Alexey Melezhik

