
sub merge-sort(@a) {

  my @tmp;

  my $inv-cnt = 0;

  say @a.perl;

  if @a.elems == 1 {
    say "we reach a leaf!";
    return ($inv-cnt, @a);
  }

  my $m = @a.elems % 2 == 0 ?? @a.elems / 2 - 1 !! floor(@a.elems / 2);

  say "middle index: $m ({@a[$m]})";

  my $cnt;

  ($cnt, my @left) = merge-sort(@a[0 .. $m]).flat; $inv-cnt += $cnt;

  ($cnt, my @right) =  merge-sort(@a[$m + 1 .. *]).flat; $inv-cnt += $cnt;

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
        $inv-cnt += @left.elems;
        for @left -> $s {
          say "inv ({$inv-cnt}): $s > {@right[0]}";
        }
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

  return ($inv-cnt, @out);

}


#say "a-sort1:", merge-sort([12, 11, 13, 5, 6, 7]);

say "a-sort2:", merge-sort([2, 1, 7, 5, 56, 7, 6]);
say "a-sort3:", merge-sort([8, 4, 2, 1]);
say "a-sort4:", merge-sort([3,1,2]);
say "a-sort5:", merge-sort([1,2,3,4,5,6]);
say "a-sort6:", merge-sort([3,5,1,4,2]);
say "a-sort7:", merge-sort([2, 1, 3, 1, 2]);
say "a-sort8:", merge-sort([5,2,6,1]);
say "a-sort11:", merge-sort([468, 335, 1, 170, 225, 479, 359, 463, 465, 206, 146, 282, 328, 462, 492, 496, 443, 328, 437, 392, 105, 403, 154, 293, 383, 422, 217, 219, 396, 448, 227, 272, 39, 370, 413, 168, 300, 36, 395, 204, 312, 323]);
say "a-sort9:", merge-sort([2,1,34,73,2,5,8,34,56]);


