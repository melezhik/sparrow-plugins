use JSON;

my $file = story_var("file");

open F, $file or die "can't open file $file to read: $!";
my $json = join "", <F>;
close F;

my $data = decode_json($json);

my $token = $data->{access_token};

update_state({ token => $token });
