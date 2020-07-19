my @hosts;

push @hosts, %(
  host => "rakudist.raku.org",
  tags => "plugin=docker-engine,name=sparrow-plugins-updater"
);

say 100;

@hosts;
