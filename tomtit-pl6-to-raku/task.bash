set -e

dir=$(config dir)

echo "dir: $dir | renaming *.pl6 to *.raku, *.pm6 to *.rakumod"

find $dir -name "*.pl6" \
-exec raku  -e '

  my $a  = "{}";

  $a.=subst(/".pl6"/,"");

  say "mv -v {$a}.pl6 {$a}.raku"' \; \
| bash

find $dir -name "*.pm6" \
-exec raku  -e '

  my $a  = "{}";

  $a.=subst(/".pm6"/,"");

  say "mv -v {$a}.pm6 {$a}.rakumod"' \; \
| bash
