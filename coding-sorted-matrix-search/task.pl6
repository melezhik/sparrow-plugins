use Colorizable;

my @matrix = Array.new;
my $N = config()<N>;

for 0 .. $N-1 -> $r { # every row
  for 0 .. $N-1 -> $c { # every column 
    if $r == 0 {
      @matrix[$r].push(10*($c+1)) # pushing to 0-th row   
    } else {
      @matrix[$r].push(@matrix[$r-1][$c]+10) # pushing to i-th row   
    }
  }
}


my $rnd_row = ( 0 .. $N -1 ).pick;
my $rnd_col = ( 0 .. $N -1 ).pick;

dump-matrix();

say "rnd row: $rnd_row";
say "rnd col: $rnd_col";

sub dump-matrix () {

  say "\n", "====" x $N ;
  for 0 .. $N-1 -> $i {
    print "|";
    for 0 .. $N-1 -> $j {
      my $num = sprintf "%.3d",@matrix[$i][$j];
      my $num-col = "$num" but Colorizable;
      if $i == $rnd_row && $j == $rnd_col {
          print("{$num-col.red.on-blue.bold}|");
      } else {
          print("$num|");
      }
    }
    say "\n", "====" x $N ;
  }
  

}

=begin data

  10 20 30 40 50 60 70
  20 40 60 80 90 92 99
  30
  40
  50 

=end data
