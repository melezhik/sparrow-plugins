my @hosts;

push @hosts, %(
  host => "rakudist.raku.org",
  tags => "plugin=postgresql-check,name=sparrow-plugins-updater"
);

say 100;

@hosts;
