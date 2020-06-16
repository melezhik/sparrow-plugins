# ado-repo-create

Creates Git repository in Azure Devops project

# Install

    s6 --install ado-repo-create

#

# Usage

    s6 --plg-run ado-repo-create@project=58c603ae-7f3e-514f-b0c3-237574a3g382,repo=Configurations

# Authetication

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


