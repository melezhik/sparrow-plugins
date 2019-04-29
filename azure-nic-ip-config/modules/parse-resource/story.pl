use JSON;

my $file = story_var("list");

my $pattern = config()->{"pattern"};


open F, $file or die "can't open file $file to read: $!";
my $json = join "", <F>;
close F;

update_state(decode_json($json)->[0]);
