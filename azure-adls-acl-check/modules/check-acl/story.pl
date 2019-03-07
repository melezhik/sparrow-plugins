use JSON;

my $i=0;

my $file = story_var("file");

open(my $fh, $file) or die "can't open file file to read: $!";

my $s = join "", <$fh>;

close $fh;

my $data = decode_json($s);

print join "\n", @{$data->{entries}};



