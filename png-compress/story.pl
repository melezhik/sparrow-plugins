use strict;

use GD;

my $in_file           = config()->{in};
my $out_file          = config()->{out};
my $compression_level = config()->{compression};

my $image = GD::Image->new($in_file) or die $!;

open(my $out, '>', $out_file) or die $!;
print $out $image->png($compression_level);
close($out);


