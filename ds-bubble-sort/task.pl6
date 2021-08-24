sub bubble-sort (@a) {

  say "input: {@a.perl}";

  my $change-any = True;
  my $tail = 0;

  while $change-any == True {

    $change-any = False;

    for 0 .. @a.elems - 2 - $tail -> $i {

      if @a[$i] > @a[$i+1] {
        $change-any = True;
        my $a = @a[$i]; my $b = @a[$i+1];
        say "swap: $a <=> $b";
        @a[$i+1] = $a; @a[$i] = $b; # do swap 
      }

    }

    $tail++; # bump ordered tail counter
  }

  return @a;
}

say "a-sort1:", bubble-sort([12, 11, 13, 5, 6, 7]);
say "a-sort2:", bubble-sort([2, 1, 7, 5, 56, 7, 6]);
