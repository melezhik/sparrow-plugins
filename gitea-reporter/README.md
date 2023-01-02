# SYNOPSIS

Gitea reporter

# USAGE

In SparrowCI reporter pipeline, to report commit status back to gitea:

```yaml
secrets:
  - GT_TOKEN # this should be gitea api token
tasks:
  -
    name: gitea-reporter
    default: true
    plugin: gitea-reporter
    config: 
      gitea_url: http://127.0.0.1:3000
      action: commit-status
```

# Author

Alexey Melezhik

