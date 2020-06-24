use YAMLish;

my $path = config()<path>; 

say "parse META from $path ...";

my $yaml = load-yaml($path.IO.slurp);

my @list;

if $yaml<depends> && $yaml<depends><runtime> && $yaml<depends><runtime><requires> {

  for $yaml<depends><runtime><requires><> -> $d {
    if $d ~~ /^^ (\S+) ':from<native>' (.*) $$ / {
      say "parse $0 .. $1";
      push @list, %( library => "$0", version => "$1");
    }
  }
}

say "libraries found";
say "===========================";
for @list -> $i {
  say $i.perl;
}
say "===========================";

update_state(%( list => @list ));

=begin example
"curl:from<native>:ver<4>",
"libcmark:from<native>:ver<0.23.0>"
=end example
