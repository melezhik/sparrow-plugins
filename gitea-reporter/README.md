# SYNOPSIS

Gitea reporter

# INSTALL

    $ s6 --install gitea-reporter

# USAGE

In SparrowCI pipeline, to report commit status to gitea:

```yaml
secrets:
  - GT_TOKEN # this should be gitea api token
tasks:
  -
    name: gitea-reporter
    plugin: gitea-reporter
    config: 
      gitea_url: http://127.0.0.1:3000
      sparrowci_url: http://127.0.0.1:2222
      action: commit-status
```

# Author

Alexey Melezhik

