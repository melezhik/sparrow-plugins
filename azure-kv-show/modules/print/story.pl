use JSON;

use Text::Table::Tiny qw/ generate_table /;


my @items = @{story_var("items")};
my $dir = story_var("dir");

my @rows;

push @rows, ['Name', 'Value'];

for my $i (@items) {

  my $file = "$dir/$i.json";

  if ( open(my $fh, $file) ){

   my $s = join "", <$fh>;

   close $fh;

   my $data = decode_json($s);

   push @rows, [ $i, $data->{value} ]

  } else {

   push @rows, [ $i, '?' ]

  }

}


print generate_table(rows => \@rows, header_row => 1, separate_rows => 1);

