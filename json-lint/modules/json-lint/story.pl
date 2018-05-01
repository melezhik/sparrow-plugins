use strict;

use JSON;

my $f = story_var('path');

open JSON1, $f or die "can't open $f to read: $!";
my $json = join "", <JSON1>;
close JSON1;

print "validate $f ... \n";

decode_json $json;

