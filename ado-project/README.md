# ado-project

Get Azure Devops project data

# Install

    s6 --install ado-project

# Usage

Cli

    s6 --plg-run ado-project@project=Backends

API

    my %state = task-run "git project", "ado-project", %(
      project => "Backends",
    );

    say %state<id>; # project ID
    say %state<url>; # project URL

Handling errors

In case of any errors response would have defined `errorCode` field,
with some description in `message`:


    if %state<errorCode>.defined {
      say "error code: {%state<errorCode>} {%state<message>}";
    }

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


# Author

Aleksei Melezhik


