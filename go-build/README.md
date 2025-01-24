# go-build

Build golang project

# Install

    s6 --install go-build

# Usage

```raku
task-run "build", "go-build", %(
  path => [
    'cmd/web/main.go',
    'cmd/cli/main.go',
  ]
);
```

# Parameters

## path

Array. Files to build

# Author

Alexey Melezhik



