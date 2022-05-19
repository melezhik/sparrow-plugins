use Data::Dumper;

use strict;

sub check {

  my $s = shift;

  my @a = (0) x 256;

  #print Dumper(\@a);

  for my $l (split //, $s) {
    my $ord = ord($l);
    print "$l has ord: $ord\n";
    $a[$ord]++;
  }

  my $i = 0;

  my $cnt = 0;

  for (grep {$_} @a) {
    print $_ % 2, "\n";
    if ($_ % 2 > 0) {
      $cnt++;
    }
  }

  print $s, $cnt > 1 ? " is not " : " is ", "a palindrome", "\n";

}

check("geeksforgeeks");
check("geeksogeeks");
