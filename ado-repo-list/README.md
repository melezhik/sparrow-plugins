# ado-repo-list

List Git repositories in Azure Devops project

# Install

    s6 --install ado-repo-list

# Usage

CLI

    s6 --plg-run ado-repo-list@project=Backends

API

    my %state = task-run "git repos", "ado-repo-list", %(
      project => "Backends",
    );

    for %state<list><> -> $r {
      say "name: {$r<name>}";
      say "id: {$r<id>}";
      say "default branch: {$r<defaultBranch>||'NA'}";
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


