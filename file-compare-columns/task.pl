use strict;

my @f1;
my @f2;

open F, config()->{file1} or die $!;
while (<F>){
  chomp;
  next unless /\S+/;
  push @f1, [ split /\s+/ ];
}
close F;

open F, config()->{file2} or die $!;
while (<F>){
  chomp;
  next unless /\S+/;
  push @f2, [ split /\s+/ ];
}
close F;


my $c1 = config()->{'match_col_num'}-1;
my $c2 = config()->{'mismatch_col_num'}-1;

#print "match: $c1, mismatch: $c2\n";

for my $l1 (@f1){
  for my $l2 (@f2){
    if ($l1->[$c1] eq $l2->[$c1] and $l1->[$c2] ne $l2->[$c2]){
      print join " ", (@{$l1}, $l2->[$c2]);
      print "\n";
    }
  }
}
