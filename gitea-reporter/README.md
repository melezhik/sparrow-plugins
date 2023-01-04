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
      gitea_url: http://host.docker.internal:3000
      action: commit-status
```

# Author

Alexey Melezhik

