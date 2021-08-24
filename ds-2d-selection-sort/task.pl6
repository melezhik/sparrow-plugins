sub selection-sort (@a) {

  say "input: {@a.perl}";

  my $tail-first-index = @a.elems - 1;
  my $head-first-index = 0;
  my $sorted-cnt = 0;

  while $sorted-cnt < @a.elems {

    my $max = @a[$head-first-index];
    my $max-index = $head-first-index;

    my $min = @a[$head-first-index];
    my $min-index = $head-first-index;
    
    for $head-first-index .. $tail-first-index  -> $i {

      if @a[$i] > $max {
        $max = @a[$i];
        $max-index = $i;
        say "update max: $max at $max-index";
      }

      if @a[$i] < $min {
        $min = @a[$i];
        $min-index = $i;
        say "update min: $min at $min-index";
      }

    }

    # swap max and first in tail
    # swap min and first in head

    my $old = @a[$head-first-index]; 

    say "swap min and head: $min at $min-index <=> $old at $head-first-index";

    @a[$head-first-index] = $min; @a[$min-index] = $old;

    if $head-first-index == $max-index {
      say "adjusting max-index: $max-index => $min-index";
      $max-index = $min-index
    }

    $head-first-index++;

    my $old2 = @a[$tail-first-index]; 

    say "swap max and tail: $max at $max-index <=> $old2 at $tail-first-index";

    @a[$tail-first-index] = $max; @a[$max-index] = $old2;

    $tail-first-index--;

    $sorted-cnt+=2;

    say "\@a: {@a.perl} | sorted-cnt: $sorted-cnt | head-first-index: $head-first-index | tail-first-index: $tail-first-index";


  }

  return @a;

}

say "a-sort1:", selection-sort([12, 11, 13, 5, 6, 7]);
say "a-sort2:", selection-sort([2, 1, 7, 5, 56, 7, 6]);
say "a-sort3:", selection-sort([2, 3, 7, 7, 6, 2, 6, 3, 10, 1, 3]);

