# ado-git-branch-init

Initialize Git repository in Azure Devops project.

The plugin creates a brand new branch, rather then branching off from existing branch.

If you need to branch off see `ado-git-branch-create` plugin.


# Install

    s6 --install ado-git-branch-init

# Usage

    s6 --plg-run ado-git-branch-init@project=Backends,repo=Catalog,branch=feature

# Parameters

* `project`

Ado project name

* `repo`

Repository name

* `branch`

New branch name

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


