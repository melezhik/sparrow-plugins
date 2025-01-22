# find

Simple find in text files

# Install

    s6 --install find

# Usage

```raku
task-run "find go main funcs", "find", %(
  :ext<go>,
  :search1<main>,
  :search<func>,
);
```

# Parameters

## ext

File extension, optional, default is `go`

## search1

First string to search. Mandatory

# search2

Second string to search. Optional

# exclude

Exclude results with string `exclude`, optional

# Author

Alexey Melezhik



