use strict;

my $path = config()->{path};

my $out = `du -a --max-depth=1 $path | sort -n`;

my %data;
my ($cnt, $g1, $g2, $g3, $g4, $g5 );
for my $l (split /\n/, $out) {

  chomp $l;


  my ($size, $dir ) = split /\s+/, $l;

  next if $dir eq $path;

  #print "[$l]\n";

  $cnt++;

  if ($size <= 104857600 ){ # under 100 MB
    $g1++;
  } elsif ( $size <= 262144000   ) { # between 100-250
    $g2++;
  } elsif ( $size <= 524288000 ) { # between 250-500 
    $g3++;
  } elsif ( $size <= 1099511627776 ) { # between 500-1TB
    $g4++;
  } else { # bigger 1TB
    $g5++;
  }

};

print "sub folders: $cnt\n";
print "under 100 MB: ", $g1||0, "/", int($g1/$cnt)*100, "% \n";
print "between 100-250: ", $g2||0, "/", int($g2/$cnt)*100, "% \n";
print "between 250-500: ", $g3||0, "/", int($g3/$cnt)*100, "% \n";;
print "between 500-1TB: ", $g4||0, "/", int($g4/$cnt)*100, "% \n";;
print "bigger 1TB: ", $g5||0, "/", int($g5/$cnt)*100, "% \n";;

