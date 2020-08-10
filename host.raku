my @hosts;

push @hosts, %(
  host => "rakudist.raku.org",
  tags => "plugin={tags()<plugin>},name=sparrow-plugins-updater"
);

say 100;

@hosts;
