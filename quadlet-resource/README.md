# SYNOPSIS

Create quadlet resources.

The list of supported resources:

* container
* network (tbd)
* volume (tbd)

# INSTALL

    $ s6 --install quadlet-resource

# USAGE

## Cli

```
s6 --plg-run quadlet-resource@name=nginx,rootless,port=9000:90
```

## Raku

```raku
#!raku

# install container quadlet
my $s = task_run "app quadlet", "quadlet", %(
  :type<container>, 
  :description<app server>,
  :name<my-app>,
  :containername<my-app-%i>,
  :hostname<my-app-%i>,
  :port<8080:80>,
  :image<my-app:%i>,
  :network<myapp.network>,
  :label<app=my-app>,
);

bash "systemctl --user daemon-reload" if $s<changed>;

# deploy new version of application
bash "ln -s my-app@.container my-app@feature-foo.container", %(
  :cwd</etc/containers/systemd>,
);

bash "systemctl --user daemon-reload";

```

# Parameters

## type

A quadlet resource type

## name

A quadlet resource name. For type=container it corresponds to ContainerName

## containername

A quadlet container name. Applicable for type=container

## hostname

A quadlet resource hostname. Applicable for type=container

## description

A quadlet resource description

## rootless

Boolean. Use rootless mode. Optional. Default is `False` 

## image

Container image, applicable for type=container

## port

Ports exposed, applicable for type=container

## network

Pod network, applicable for type=container. Optional. Default value is `host`

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
