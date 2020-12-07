use Colorizable;
use Data::Dump;

my @M = Array.new;
my $N = config()<N>;

for 0 .. $N-1 -> $r { # every row
  my $rnd_shift = ( 2 .. $N -1 ).pick;
  for 0 .. $N-1 -> $c { # every column 
    if $r == 0 {
      @M[$r].push(10*($c+1)) # pushing to 0-th row   
    } else {
      @M[$r].push(@M[$r-1][$c]+$rnd_shift*2) # pushing to i-th row   
    }
  }
}


my $rnd_row = ( ceiling($N / 2) .. $N -1 ).pick;
my $rnd_col = ( ceiling($N / 2) .. $N -1 ).pick;

my $middle =  get-middle(@M)<middle>;

dump-matrix @M, %(
  "{$rnd_row}:{$rnd_col}" => "blue",
  "{$middle}:{$middle}" => "cyan",
  "{$middle+1}:{$middle+1}" => "magenta"
);

my $x = @M[$rnd_row;$rnd_col];

say "rnd row: $rnd_row";
say "rnd col: $rnd_col";
say "x($rnd_row,$rnd_col): [$x]";

say "==================================== [SEARCH] ====================================";

search(@M,$x);

sub dump-matrix (@matrix,%high) {

  #say Dump(%high);

  print "|";
  for 0 .. @matrix[0].elems - 1 -> $i {
      my $num = sprintf "%.3d",$i;
      my $num-col = "$num" but Colorizable;
      print "{$num-col.red.bold}|";
  }

  say "\n", "====" x @matrix[0].elems;

  for 0 .. @matrix.elems - 1 -> $i {
    print "|";
    for 0 .. @matrix[$i].elems - 1  -> $j {
      my $num = sprintf "%.3d",@matrix[$i][$j];
      my $num-col = "$num" but Colorizable;
      if %high{"{$i}:{$j}"}:exists {
          my $method = %high{"{$i}:{$j}"};
          print($num-col."$method"().bold,"|");
      } else {
          print("$num|");
      }
    }
    say "\n", "====" x @matrix[0].elems ;
  }
  

}

sub get-middle (@matrix) {

  my $middle =  ceiling(@matrix[0].elems / 2) - 1;
    
  my $lower_corner_val =  @matrix[$middle][$middle];
  my $upper_corner_val =  $middle == 0 ?? @matrix[$middle][$middle] !! @matrix[$middle+1][$middle+1];

  my $upper_row; my $upper_col;
  my $end = False;

  if @matrix.elems == 1 {

    $upper_col = $middle;
    $upper_row = $middle;
    $end = True;
  } else {
  
    $upper_col = $middle + 1;
    $upper_row = $middle + 1;

  }

  return %(
   middle =>  $middle, 
   upper_row => $upper_row, 
   upper_col => $upper_col,
   upper_corner_val => $upper_corner_val,
   lower_corner_val => $lower_corner_val,
   end => $end,
  )  

}

sub search (@matrix is copy ,$x) {

    my %data = get-middle(@matrix);

    #return if %data<end>;

    my $middle =  %data<middle>;
    
    my $lower_corner_val =  %data<lower_corner_val>;
    my $upper_corner_val =  %data<upper_corner_val>;

    say "[Search x=$x] N: [{@matrix[0].elems}]";
    say "lower_corner_val($middle:$middle): [$lower_corner_val]";
    say "upper_corner_var({%data<upper_row>}:{%data<upper_col>}): [$upper_corner_val]";

    dump-matrix @matrix, %(
      "{$middle}:{$middle}" => "cyan",
      "{%data<upper_row>}:{%data<upper_col>}" => "magenta"
    );
    
    if $x == $lower_corner_val or $x == $upper_corner_val {
      say "found x=[$x]";
      return True
    }  elsif %data<end> {
       return 
    } elsif $x > $upper_corner_val {
      if $middle > 0 {
        say "search in the east-north block ...";
        my @b =  block(
          @matrix,
          0,$middle,
          $middle+1,@matrix[0].elems - 1
        );
        search(@b,$x);
        say "search in the east-south block ...";
        dump-matrix @matrix, %();
        exit(0);
        @b = block(
          @matrix,
          $middle+1, @matrix.elems - 1,
          $middle+1, @matrix[0].elems - 1
        );
        search(@b, $x);
      } elsif $middle == 0 {
        my @b = [ [ @matrix[0][1] ] ];
        search(@b, $x);
      }  
      #say "search in the right-south block ...";
      #search(@matrix[$lower_row .. *; $lower_col .. *],$x,$upper_row);
    } elsif $x < $lower_corner_val {
      say "go up the river";
    } else {
      if @matrix.elems == 1 {
        say "we run out of elements"
      } else {
        say "better luck in other quadrants"

      }
    }


}

sub block (@matrix, $r_from, $r_to, $c_from, $c_to) {

    my @block;
    
    say "cut [$r_from .. $r_to] [$c_from .. $c_to] ";
    for $r_from .. $r_to -> $i {
      for $c_from .. $c_to -> $j {
          @block[$i].push: @matrix[$i][$j]
      }
    }

    #dump-matrix @block,%();

    return @block
}

=begin data

  10 20 30 40 50 60 70
  20 40 60 80 90 92 99
  30
  40
  50 

=end data
