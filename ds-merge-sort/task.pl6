sub merge-sort(@a) {

  say @a.perl;

  if @a.elems == 1 {
    say "we reach a leaf!";
    return @a;
  }

  my $m = @a.elems % 2 == 0 ?? @a.elems / 2 - 1 !! floor(@a.elems / 2);

  say "middle index: $m ({@a[$m]})";

  my @left = merge-sort(@a[0 .. $m]);

  my @right = merge-sort(@a[$m + 1 .. *]);

  say "join {@left} <=> {@right}";

  my @out;

  my $i;

  while True {
    #say "left elems: ", @left.elems;
    #say "right elems: ", @right.elems;
    if @left.elems && @right.elems {
      if @left[0] <= @right[0] {
        @out.push(@left.shift) 
      } else {
        @out.push(@right.shift) 
      }      
    } elsif @left.elems {
        for @left -> $e { @out.push($e)};
        last;
    } elsif @right.elems {
        for @right -> $e { @out.push($e)};
        last;
    } else {
      last
    }
  }

  say "out:", @out;

  return @out;

}


say "a-sort1:", merge-sort([12, 11, 13, 5, 6, 7]);;
say "a-sort2:", merge-sort([2, 1, 7, 5, 56, 7, 6]);;

