sub selection-sort (@a) {

  say "input: {@a.perl}";

  my $j = @a.elems - 1;

  while $j >= 1 {

    my $max = @a[0];
    my $max-index = 0;
    say "set max to: $max";
    
    for 0 .. $j  -> $i {

      if @a[$i] > $max {
        $max = @a[$i];
        $max-index = $i;
        say "update max: $max at $max-index";
      }

    }

    # push max to tail
    # swap max and tail
    my $old = @a[$j]; @a[$j] = $max; @a[$max-index] = $old;
    say "swap max and tail: $max at $max-index <=> $old at $j";
    $j--;

  }

  return @a;

}

say "a-sort1:", selection-sort([12, 11, 13, 5, 6, 7]);
say "a-sort2:", selection-sort([2, 1, 7, 5, 56, 7, 6]);

