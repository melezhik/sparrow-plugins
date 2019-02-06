#!perl

use File::Path qw{make_path};
use strict;

my $p = config()->{path};

make_path($p) or die "can't create directory $p, error: $!";
