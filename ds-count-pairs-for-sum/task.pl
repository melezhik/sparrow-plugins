use Data::Dumper;

use strict;

sub count {

  my $a = shift;

  my @a = sort @$a;

  my $sum = shift;

  my @nums = (0) x 1000;

  for (@a) {
    $nums[$_]++;
  }

  my $cnt = 0;

  for my $i (@a) {
    $cnt += $nums[$sum - $i];
    $cnt -- if $sum - $i == $i; # exclude "self pairs"
  }

  print "[a=[@$a] sum=$sum cnt=",$cnt/2,"]\n";

}

count([1, 5, 7, -1],6);
count([1, 5, 7, -1, 5],6);
count([1, 1, 1, 1],2);
count([10, 12, 10, 15, -1, 7, 6, 5, 4, 2, 1, 1, 1],11);
count([1, 2, 3, 4, 5, 6, 7],8);
count([1, 2, 3, 4, 5, 6, 7],98);
