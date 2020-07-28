my @hosts;

push @hosts, %(
  host => "rakudist.raku.org",
  tags => "plugin=k8s-master-check,name=sparrow-plugins-updater"
);

say 100;

@hosts;
