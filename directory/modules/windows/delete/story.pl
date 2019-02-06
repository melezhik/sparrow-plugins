#!perl

use File::Path qw{remove_tree};
use strict;

my $p = config()->{path};

remove_tree($p) or die "can't delete directory $p, error: $!";
