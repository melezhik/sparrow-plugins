#!raku

use JSON::Tiny;
use MIME::Base64;

say ">>> verify [resource={config()<type>}] [name={config<name>},namespace={config()<namespace>}]";

my  $c = get_state();

if $c<data> {
  say "[data_start]";
  if $c<data>.isa(Hash) {
    for $c<data>.keys.sort -> $i {
      if config()<type> eq 'secret' {
        say config()<sensitive> ?? "[$i=*****]" !! "[$i={MIME::Base64.decode-str($c<data>{$i})}]"
      } else {
        say "[$i={$c<data>{$i}}]"
      }
    }
  }
  say "[data_end]";
}

say "==================================================================";

