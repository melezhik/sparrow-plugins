use JSON::Tiny;

my $file = task_var("list");

my $pattern = config()<pattern>;

my $json = $file.IO.slurp;

#say "json data: $json";

my $list = from-json($json);

my %state = %(
  list => Array.new
);

say "parsing resource collection";

say "filter by pattern: [$pattern]" if $pattern;

use Data::Dump;

for $list<> -> $i {

  #say $i.^name;

  #say Dump($i);

  if $pattern {

    my $raku-pattern = /<$pattern>/;

    next unless $i<name> ~~ $raku-pattern;

    push %state<list>, $i<name>;

  } else {

    push %state<list>, $i<name>;

  }


  say '[', $i<name>, '@', $i<type>, '] ', $i<location>;

}


update_state(%state);
