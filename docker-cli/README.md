# docker-cli

Simple task to run/stop docker

# Install

    s6 --install docker-cli

# Usage

## Run docker

Run docker named "foo", with image "alpine:latest"

```raku
task-run "docker run", "docker-cli", %(
  action => "run",
  name => "foo",
  image => "alpine:latest"
);
```

Inject secrets from vault, vault path is "/sparrow":

```raku
task-run "docker run", "docker-cli", %(
  vault_path => "/sparrow/",
  vars => "foo bar baz",
  action => "run",
  name => "worker",
  image => "melezhik/sparrow:alpine"
);
```

## Stop docker

```raku
task-run "docker stop", "docker-cli", %(
  action => "stop",
  name => "foo"
);
```

# Author

Alexey Melezhik
