use Data::Dumper;

use strict;

sub urlify {

  my $s = shift;

  s/\s+$// for $s;

  chomp($s);

  my @s = split(//,$s);

  print "input string:";

  print Dumper(\@s);

  my $l = @s;

  print "input string lenght: $l\n";

  my @cnt = ($s =~ /(\s)/g);

  my $cnt = scalar(@cnt);

  print "spaces count: $cnt\n";

  die "too long string" if $l + $cnt*2 > 1000;

  push(@s,0) for (1 .. $cnt*2);

  print "extended string:";

  print Dumper(\@s);

  my $i = $l;

  my $tail = @s - 1;

  print "start: $i\n";

  print "tail: $tail\n";

  while($i > 0) {
    $i--;
    print "handle $s[$i]\n";
    if ($s[$i] ne ' '){
      $s[$tail] = $s[$i]; # copy $s[$i] to the tail
      $tail--; # shorten tail
    } else {
      $s[$tail-2] = "%"; # copy ' ' to the tail
      $s[$tail-1] = "2";
      $s[$tail] = "0";
      $tail--;
      $tail--;
      $tail--;
    }
  }
  
  print "[",(join("",@s)), "]\n";

}

urlify("Mr John Smith ")
