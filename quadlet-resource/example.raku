use Sparrow6::DSL;

my $s = task-run ".", %(
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
  volume => [
      "/etc/caddy.d:/etc/caddy.d:ro,Z",
      "caddy-data:/data:Z",
      "caddy-config:/config:Z", 
  ],
  :add_capability<NET_ADMIN>,
  exec_reload => "/usr/bin/podman exec proxy caddy reload --config /etc/caddy/Caddyfile --force",
  :restart<always>,
  :rootless,
);

say $s<changed>;

