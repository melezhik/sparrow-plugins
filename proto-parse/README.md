# proto-parse

Parse ptotobuff spec

# Install

    s6 --install proto-parse

# Usage

```
# list types

task-run "list types", "proto-parse", %(
  :file<path/to/proto/file>
);

# dump specific type

task-run "list types", "proto-parse", %(
  :file<path/to/proto/file>,
  :action<dump>,
  :type<HelloWorldRequest>,
);

```

# Parameters

## action

One of `list|dump`, optional, default value is `list` - list types

## file

Path to proto file, required

## type

Name of prototype type to dump. All children dumped recursively. Required, when
action == 'dump
