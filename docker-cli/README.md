# docker-cli

Simple task to run/stop docker

# Install

    s6 --install docker-cli

# Usage

## Run docker

## Examples

## Run docker container

With container name "worker" and with image "alpine:latest":

```raku
task-run "docker run", "docker-cli", %(
  action => "run",
  name => "worker",
  image => "alpine:latest"
);
```

## Inject secrets from vault

Vault paths are: "/sparrow/foo", "/sparrow/bar", "/sparrow/baz".

Secret data should be placed in `value` key.

```raku
task-run "docker run", "docker-cli", %(
  vault_path => "/sparrow/",
  secrets => "foo bar baz",
  action => "run",
  name => "worker",
  image => "melezhik/sparrow:alpine"
);
```

## Inject enviorment variables

Pass two variables: name=SparrowCI, language=Raku:

```raku
task-run "docker run", "docker-cli", %(
  options => "-e name=SparrowCI -e language=Raku",
  action => "run",
  name => "worker",
  image => "melezhik/sparrow:alpine"
);
```

## Stop docker

```raku
task-run "docker stop", "docker-cli", %(
  action => "stop",
  name => "worker"
);
```

# Author

Alexey Melezhik
