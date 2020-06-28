use JSON::Tiny;

my $path = config()<path>; 

say "parse META from $path ...";

my $yaml = from-json($path.IO.slurp);

my @list;

if $yaml<depends> && $yaml<depends>.isa("Array") {

  for $yaml<depends><> -> $d {
    parse-native($d)
  }
}

if $yaml<depends> && $yaml<depends><runtime> && $yaml<depends><runtime><requires> {

  for $yaml<depends><runtime><requires><> -> $d {
    parse-native($d)
  }
}

say "libraries found";
say "===========================";
for @list -> $i {
  say $i.perl;
}
say "===========================";

update_state(%( list => @list, packages => [] ));

sub parse-native ($d) {

    if $d ~~ /^^ (\S+) ':from<native>' (.*) $$ / {
      say "parse $0 .. $1";
      my $library = "$0";
      my $version-chunk = "$1";
      my $version = $version-chunk;

      if $version-chunk ~~ /':ver<' (\S*) '>'/ {
        $version = "$0"
      }

      push @list, %( library => $library, version => $version );
    }

}

=begin example
"curl:from<native>:ver<4>",
"libcmark:from<native>:ver<0.23.0>"
=end example
