use JSON;

my $file = task_var("list");

my $pattern = config()->{"pattern"};


open F, $file or die "can't open file $file to read: $!";
my $json = join "", <F>;
close F;

my @list = @{decode_json($json)};

my $state = { list => [] } ;

for my $i (@list) {

  if ($pattern){

    next unless $i->{name} =~ /$pattern/;
    push @{$state->{list}}, $i->{name};
  }

  print '[', $i->{name}, '@', $i->{type}, '] ', $i->{location}, "\n"; 
  
}


update_state($state);
