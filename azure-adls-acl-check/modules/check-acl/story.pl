use JSON;

my $i=0;
my $dir = story_var("basedir");

for my $c (@{config()->{list}}){

  $i++;

  my $file = "$dir/$i.json";

  if ( open(my $fh, $file) ){

   my $s = join "", <$fh>;

   close $fh;

   my $data = decode_json($s);

   print "[$c->{path}]\n";
   print join "\n", @{$data->{entries}};
   print "\n[$c->{path}]\n";

  }

}

