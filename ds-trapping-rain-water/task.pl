use Data::Dumper;

use strict;

sub count {

  my @a = @_;

  my @max_left;

  my @max_right;

  my $max = 0;
  my $k = 0;

  #print "input:", (join " ", @a), "\n";

  for my $i (@a) {
    $max = max($max,$i);
    push @max_left,$max;
    #print("push max=$max to i=$i at $k\n");
    $k++;
  }

  my $max = $a[-1];

  print "=======\n";

  for my $i (reverse @a) {
    $max = max($max,$i);
    unshift @max_right,$max;
    #print("push max=$max to i=$i at $k\n");
    $k++;
  }

  my $cnt;

  for my $i (0 .. scalar(@a) - 1){
    my $inc = min($max_left[$i],$max_right[$i]) - $a[$i];  
    #print "inc=$inc for i=$i, a_i=$a[$i], left_max=$max_left[$i], max_right=$max_right[$i]\n";
    $cnt += $inc;  
  }

  print "output: [", (join " ", @a), "] cnt=$cnt\n";
}


sub max {

  my $a = shift;
  my $b = shift;

  return $a > $b ? $a : $b;
}

sub min {

  my $a = shift;
  my $b = shift;

  return $a < $b ? $a : $b;
}

print <<HERE;
   X
 X X X
XXXX XX
///////
HERE

count(1,2,1,3,0,2,1);
count(2,0,2);
count(3, 0, 2, 0, 4);
count(7,4,0,9);
count(6,9,9);
__END__


   X
 X X X
XXXX XX
///////
