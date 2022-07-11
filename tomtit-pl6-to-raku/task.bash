find .tom -name "*.pl6" \
-exec raku  -e '
  my $a  = "{}"; 
  $a.=subst(/.pl6/,'.raku');
  say "mv -v $a.pl6 $a.raku"' \; \
| bash
