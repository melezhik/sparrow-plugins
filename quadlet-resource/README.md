# SYNOPSIS

Create quadlet resources.

The list of supported resources:

* container
* network (tbd)
* volume (tbd)

# INSTALL

    $ s6 --install quadlet

# USAGE

## Cli

```
s6 --task-run .@name=nginx,rootless,port=9000:90
```

## Raku

```raku
#!raku
my $s = task_run "nginx quadlet", "quadlet", %(
  :type<container>, 
  :description<nginx server>,
  :name<nginx>,
  :port<8080:80>,
  :image<docker.io/nginxinc/nginx-unprivileged>,
  :network<myapp.network>,
  :rootless,
);

bash "systemctl --user daemon-reload" if $s<changed>;

```

# Parameters

## type

A quadlet resource type

## name

A quadlet resource name

## description

A quadlet resource description

## rootless

Boolean. Use rootless mode. Optional. Default is `False` 

## image

Container image, for type=container

## port

Ports exposed, for type=container

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)


