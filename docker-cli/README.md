# docker-cli

Simple wrapper against docker cli

# Install

    s6 --install docker-cli

# Usage

## Run docker

Run docker named "foo", with image "alpine:latest"

```raku
task-run ".", %(
  action => "run",
  name => "foo",
  image => "alpine:latest"
);
```

Inject secrets from vault, vault path is "/sparrow":

```raku
task-run ".", %(
  vault_path => "/sparrow/",
  vars => "foo bar baz",
  action => "run",
  name => "worker",
  image => "melezhik/sparrow:alpine"
);
```

## Stop docker

```raku
task-run ".", %(
  action => "stop",
  name => "foo"
);
```

# Author

Alexey Melezhik
