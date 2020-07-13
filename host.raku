my @hosts;

push @hosts, %(
  host => "rakudist.raku.org",
  tags => "plugin=set-mysql,name=sparrow-plugins-updater"
);

say 100;

@hosts;
