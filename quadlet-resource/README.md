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
s6 --task-run .@type=network,name=my-app,rootless
s6 --plg-run quadlet-resource@type=container,name=my-app,rootless,port=9000:90,network=my-app.network
```

## Raku

```raku
#!raku

# create quadlet network
my $s = task-run "app quadlet", "quadlet-resource", %(
  :type<network>, 
  :description<podman network>,
  :name<my-app>,
  :subnet<10.10.0.0/24>,
  :gateway<10.10.0.1>,
  :dns<9.9.9.9>,
);

bash "systemctl daemon-reload" if $s<changed>;

# install container quadlet
$s = task-run "app quadlet", "quadlet-resource", %(
  :type<container>, 
  :description<app server>,
  :name<my-app>,
  :containername<my-app-%i>,
  :hostname<my-app-%i>,
  :port<8080:80>,
  :image<my-app:%i>,
  :network<my-app.network>,
  :label<app=my-app>,
);

bash "systemctl daemon-reload" if $s<changed>;

# deploy new version of application
bash "ln -s my-app\@.container my-app\@feature-foo.container", %(
  :cwd</etc/containers/systemd>,
);

bash "systemctl daemon-reload";

service-start "my-app\@feature-foo";

```

# Parameters

## type

A quadlet resource type

## name

A quadlet resource name. For type=container it corresponds to template name

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
