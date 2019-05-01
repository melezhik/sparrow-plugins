use strict;

use JavaScript::Minifier qw(minify);


my $in_file = config()->{in};
my $out_file = config()->{out};
 
open(my $in, $in_file) or die $!;
open(my $out, '>', $out_file) or die $!;
 
minify(input => $in, outfile => $out);
 
close($in);
close($out);


