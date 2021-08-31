#!raku

use JSON::Tiny;

my $c = get_state();

say ">>> verify [node] [name={config<name>}]";

say "name={$c<metadata><name>}";
say "==========================";

update_state($c);

#say $c<metadata><annotations>.perl;

if $c<metadata><annotations> {

  say "[annotations_start]";

  for $c<metadata><annotations>.keys -> $k {
    say "[$k={$c<metadata><annotations>{$k}}]"
  }

  say "[annotations_end]";

}

if $c<metadata><labels> {

  say "[labels_start]";

  for $c<metadata><labels>.keys -> $k {
    say "[$k={$c<metadata><labels>{$k}}]"
  }

  say "[labels_end]";

}

say "==================================================================";

