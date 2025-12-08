use JSON::Fast;

my $version = config()<version>;

say "failed modules for version: $version";
say "=====================================";

my @list;

my $base-dir = "{%*ENV<HOME>}/.brownie/versions/$version/";

for dir($base-dir).sort({.basename}) -> $i {
  next unless $i ~~ :d;
  next unless "{$base-dir}/{$i.basename}/meta.json".IO ~~ :f;
  my $m = from-json("{$base-dir}/{$i.basename}/meta.json".IO.slurp);
  next unless $m<status> == False; 
  if config()<fail-only> { # only fillter out modules with failed tests
    next unless $m<testfail>:exists;
    next unless $m<testfail>; 
  }
  push @list, %( 
      module => $i.basename, 
      report => $m<log>,
  );

  say $i.basename;
}

say "===";

update_state(%( list => @list ));
