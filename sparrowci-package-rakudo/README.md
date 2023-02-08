# sparrowci-package-rakudo

Installs rakudo package on sparrowci

# Install

    s6 --install sparrowci-package-rakudo

# Usage

```yaml
  tasks:
    -
      name: install-rakudo
      plugin: sparrowci-package-rakudo
      config:
        version: 4f519c2
```

# Parameters

## version

Rakudo version. Optional. Default values is `HEAD`.

Examples:

```
4f519c2 # short SHA
4f519c2ea8c63ce26deae8fc6f854081485605f6 # full SHA
HEAD # symbolic name
```

# Platforms

* Alpine OS

# Author

Alexey Melezhik
