use YAMLish;

my $path = config()<path>; 

my $yaml = load-yaml($path.IO.slurp);



if $yaml<depends> && $yaml<depends><runtime> && $yaml<depends><runtime><requires> {

  for $yaml<depends><runtime><requires><> -> $d {
    say $d.perl
  }
}
 
