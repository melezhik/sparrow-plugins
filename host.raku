my @hosts;

push @hosts, %(
  host => "rakudist.raku.org",
  tags => "plugin=service,name=sparrow-plugins-updater"
);

say 100;

@hosts;
