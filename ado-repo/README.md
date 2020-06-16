# ado-repo-create

Show information about Git repository in Azure Devops project

# Install

    s6 --install ado-repo-create

# Usage

    my %state = task-run "git repo", "ado-repo", %(
      project => "Backends",
      repo => "Catalog"
    );

    say %state<id>; # repo ID
    say %state<url>; # repo URL

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


