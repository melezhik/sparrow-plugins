# proto-parse

Parse ptotobuff spec

# Install

    s6 --install proto-parse

# Usage

```
# list types

my $st = task-run "list types", "proto-parser", %(
  :file<path/to/proto/file>
);

say $st<list>.raku;

# [{:name("UserCreateRequest"), :type("message")}, {:name("UserCreateResponse"), :type("message")}, {:name("UserGetRequest"), :type("message")}, {:name("UserGetResponse"), :type("message")}, {:name("UserDeleteRequest"), :type("message")}, {:name("UserDeleteResponse"), :type("message")}]

# dump specific type

task-run "dump type", "proto-parser", %(
  :file<path/to/proto/file>,
  :action<dump>,
  :type<UserCreateRequest>,
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
