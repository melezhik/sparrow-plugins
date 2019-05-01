use JSON;

use Text::Table::Tiny qw/ generate_table /;


my @items = @{task_var("items")};
my $dir = task_var("dir");
my $kv = task_var("kv");
my $view = task_var("view") || "lines";

my @rows;

push @rows, ['Name', 'Value'];
my %state;

for my $i (@items) {

  my $file = "$dir/$i.json";

  if ( open(my $fh, $file) ){

   my $s = join "", <$fh>;

   close $fh;

   my $data = decode_json($s);

   push @rows, [ $i, $data->{value} ];

   $state{$i} = $data->{value}; 

  } else {

   push @rows, [ $i, '?' ]

  }

}

print "=========================================================\n";
print "key vault [$kv] secrets\n";
print "=========================================================\n";

if ($view eq "table") {

  print generate_table(rows => \@rows, header_row => 1, separate_rows => 1);

} else {

  shift @rows;

  for my $i (@rows) {
    print "$i->[0]:\t$i->[1]\n";
  }  
}  

update_state(\%state);
