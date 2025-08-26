# SYNOPSIS

Create quadlet resources.

The list of supported resources:

* container
* network
* volume (tbd)

# INSTALL

    $ s6 --install quadlet-resource

# USAGE

## Cli

```
s6 --plg-run quadlet-resource@type=network,name=my-app,rootless
s6 --plg-run quadlet-resource@type=container,name=my-app,rootless,expose=4000,network=my-app.network,add_capability=NET_ADMIN
```

## Raku

```raku
#!raku

# create quadlet network
my $s = task-run "podman network", "quadlet-resource", %(
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
  :expose<4000>,
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


# Create regular container, without container template

# install container quadlet
$s = task-run "app quadlet", "quadlet-resource", %(
  :type<container>, 
  :!templated,
  :description<proxy>,
  :name<proxy>,
  :containername<proxy>,
  :hostname(""),
  publish_port => [ "80:80", "443:443", "443:443/udp"],
  :image<ghcr.io/caddybuilds/caddy-cloudflare:alpine>,
  :network<my-app.network>,
  :label<app=my-app,type=proxy>,
  :environment_file</etc/default/proxy>,
  volume => [
      "/etc/caddy.d:/etc/caddy.d:ro,Z",
      "caddy-data:/data:Z",
      "caddy-config:/config:Z",
  ],
  :add_capability<NET_ADMIN>,
  exec_reload => "/usr/bin/podman exec proxy caddy reload --config /etc/caddy/Caddyfile --force",
  :restart<always>,
);

if $s<changed> {
  bash "systemctl daemon-reload";
  service-start "proxy.service";
}

```

# Parameters

## Common parameters

### type

A quadlet resource type

### name

A quadlet resource name. For type=container it corresponds to template name

### description

A quadlet resource description

### rootless

Boolean. Use rootless mode. Optional. Default is `False` 

## Container resource parameters

### templated

Create resource as quadlet template. Optional, default value is `True`

### containername

A quadlet container name. Applicable for type=container

### hostname

A quadlet resource hostname. Applicable for type=container. Default value is `app_%i`.

### image

Container image, applicable for type=container

### publish_port

publish_ports exposed, applicable for type=container, default value is ``, could be List or String 

### network

Pod network, applicable for type=container. Optional. Default value is `host`

### restart

default value is ``

### expose

default value is ``

### volume

default value is ``, could be List or String

### add_capability

default value is ``, could be List or String

### environment_file

default value is ``

### exec_reload

default value is ``

## Network resource parameters

### dns

Optional. Default value is ``

### gateway

Optional. Default value is ``

### subnet

Optional. Default value is ``

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
