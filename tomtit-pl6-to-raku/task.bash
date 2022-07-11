set -x

dir=$(config dir)

echo "dir: $dir | renaming *.pl6 to *.raku"

find dir -name "*.pl6" \
-exec raku  -e '
  my $a  = "{}"; 
  $a.=subst(/.pl6/,'.raku');
  say "mv -v $a.pl6 $a.raku"' \; \
| bash
