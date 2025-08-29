# SYNOPSIS

Create systemd units for services

# INSTALL

    $ s6 --install systemd-service-unit

# USAGE

## Cli

```
s6 --plg-run systemd-service-unit@name=container-deploy,exec_start="/usr/bin/go run /usr/local/bin/container-deploy.go"
```

## Raku

```raku
#!raku

# install systemd service unit

my $s = task-run "container deploy service", "systemd-service-unit", %(
  :description<container-deploy>,
  :name<container-deploy>,
  environment => [ "HOME=/root", "GOCACHE=/tmp/go-cache", "GOPATH=/tmp/go"],
  :environment_file</etc/default/container-deploy>,
  :exec_start => "/usr/bin/go run /usr/local/bin/container-deploy.go",
);

if $s<changed> {
  bash "systemctl daemon-reload";
}

```

# Parameters

## name

Unit/service name

## description

Unit description

## environment

default value is ""

## exec_start

## dry_run

Dry run mode. Optional. Default is False.

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
