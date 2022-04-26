sub insertion-sort (@a) {

  say "input: ", @a.perl;

  for 1 .. @a.elems - 1 -> $i {

    my $x = @a[$i];

    say "candidate x: $x";

    my $j = $i;

    while $j > 0 && @a[$j-1] > $x  {
      say "nn {$i}| shift: {@a[$j-1]} => ";
      @a[$j] =  @a[$j-1];
      $j--;  
    }

    @a[$j] = $x;

    say "jump_x: $x => ind[$j]", " ordered part: ", @a[0..$i];

  }

  return @a;
}


# 1 4 6 7 8 5 3

# 1 >4 5 7 8 5 3

# 1 4 >5 ...

# 1 4 5 >7

# 1 4 5 7 >8

# 1 4 5 7 8 


say "a-sort1:", insertion-sort([12, 11, 13, 5, 6, 7]);
say "a-sort2:", insertion-sort([2, 1, 7, 5, 56, 7, 6]);
