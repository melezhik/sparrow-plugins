# sparkyci-package-rakudo

Installs rakudo meta package on sparkyci

# Install

    s6 --install sparkyci-package-rakudo

# Usage

    task-run "rakudo package", "sparkyci-package-rakudo", %(
      version => "4f519c2"
    );

# Parameters

## version

Rakudo version. Optional. Default values is `HEAD`.

Examples:

```
4f519c2 # short SHA
4f519c2ea8c63ce26deae8fc6f854081485605f6 # full SHA
HEAD # symbolic name
```

# Author

Alexey Melezhik
