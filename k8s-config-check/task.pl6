#!raku

use JSON::Tiny;
use MIME::Base64;

say ">>> verify [resource={config()<resource_type>}] [name={config<name>},namespace={config()<namespace>}]";

my  $c = get_state();

if $c<data> {
  say "[data_start]";
  if $c<data>.isa(Hash) {
    for $c<data>.keys.sort -> $i {
      if config()<resource_type> eq 'secret' {
        say "[$i={MIME::Base64.decode-str($c<data>{$i})}]"
      } else {
        say "[$i={$c<data>{$i}}]"
      }
    }
  }
  say "[data_end]";
}

say "==================================================================";

