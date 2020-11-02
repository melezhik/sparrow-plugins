use Colorizable;

my @matrix = Array.new;
my $N = config()<N>;

for 0 .. $N-1 -> $r { # every row
  my $rnd_shift = ( 2 .. $N -1 ).pick;
  for 0 .. $N-1 -> $c { # every column 
    if $r == 0 {
      @matrix[$r].push(10*($c+1)) # pushing to 0-th row   
    } else {
      @matrix[$r].push(@matrix[$r-1][$c]+$rnd_shift*2) # pushing to i-th row   
    }
  }
}


my $rnd_row = ( 0 .. $N -1 ).pick;
my $rnd_col = ( 0 .. $N -1 ).pick;

dump-matrix %(
  "{$rnd_row}:{$rnd_col}" => "blue"
);

say "rnd row: $rnd_row";
say "rnd col: $rnd_col";

search(@matrix[$rnd_row][$rnd_col]);

sub dump-matrix (%high) {

  print "|";
  for 0 .. $N - 1 -> $i {
      my $num = sprintf "%.3d",$i;
      my $num-col = "$num" but Colorizable;
      print "{$num-col.red.bold}|";
  }

  say "\n", "====" x $N ;

  for 0 .. $N-1 -> $i {
    print "|";
    for 0 .. $N-1 -> $j {
      my $num = sprintf "%.3d",@matrix[$i][$j];
      my $num-col = "$num" but Colorizable;
      if %high{"{$i}:{$j}"}:exists {
          my $method = %high{"{$i}:{$j}"};
          print($num-col."$method"().bold,"|");
      } else {
          print("$num|");
      }
    }
    say "\n", "====" x $N ;
  }
  

}

sub search ( $x ) {

    my $upper_row =  ceiling($N / 2);
    my $upper_col = ceiling($N / 2);

    my $lower_row =  $upper_row + 1;
    my $lower_col =  $upper_col + 1;

    my $lower_val =  @matrix[$upper_row][$upper_col];
    my $upper_val =  @matrix[$lower_row][$lower_col];

    say "lower_val($upper_row:$upper_col): [$lower_val], upper_var($lower_row:$lower_col): [$upper_val], x($rnd_row,$rnd_col): [$x]";

    dump-matrix %(
      "{$rnd_row}:{$rnd_col}" => "blue",
      "{$upper_row}:{$upper_col}" => "cyan",
      "{$lower_row}:{$lower_col}" => "magenta"
    );
    
    if $x == $lower_val or $x == $upper_val {
      say "found x=[$x]";
      return True
    } elsif $x > $lower_val && $x < $upper_val {
      say "go down the river"
    } elsif $x < $lower_val {
      say "go up the river"
    } else {
      say "better luck in other quadrants"
    }

}

=begin data

  10 20 30 40 50 60 70
  20 40 60 80 90 92 99
  30
  40
  50 

=end data
