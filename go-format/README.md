# go-format

Runs go formater for golang project

# Install

    s6 --install go-format

# Usage

```raku
task-run "go format", "go-format";
```

# Parameters

- `files`

Files to apply go fmt command, optional, default value is `*.go`. 

Examples:

```
task-run "go format tests", "go-format", %(
  files => "*_test.go"
);
```


# Author

Alexey Melezhik



