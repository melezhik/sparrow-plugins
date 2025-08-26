use Sparrow6::DSL;

my $s = task-run ".", %(
  :type<service>,
  :!templated,
  :rootless,
  :description<container-deploy>,
  :name<container-deploy>,
  :label<app=my-app>,
  environment => [ "HOME=/root", "GOCACHE=/tmp/go-cache", "GOPATH=/tmp/go"],
  :environment_file</etc/default/container-deploy>,
  :exec_start => "/usr/bin/go run /usr/local/bin/container-deploy.go",
);

say $s<changed>;

