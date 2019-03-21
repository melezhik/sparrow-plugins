use JSON;

my $file = story_var("list");

my $pattern = config()->{"pattern"};


open F, $file or die "can't open file $file to read: $!";
my $json = join "", <F>;
close F;

my @list = @{decode_json($json)};


for my $i (@list) {

  if ($pattern){

    next unless $i->{name} =~ /$pattern/;

  }

  print '[', $i->{name}, '@', $i->{type}, '] ', $i->{location}, "\n"; 
  
}

