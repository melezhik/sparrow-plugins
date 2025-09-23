use Text::CSV;

my @out;

say "proccess {config()<file>} sort by {config()<by>} ...";

my @data = csv(in => config()<file>);
my @head = (shift @data)<>;
my $ind = 0;

say "columns: ", @head.raku;

for @head.kv -> $i,$v {
  if $v eq config()<by> {
    say "sort index found: $i";
    $ind = $i;
    last;
  }
}

my $int-mode = config()<int>;

for @data.sort({$int-mode ?? $_[$ind].Int !! $_[$ind] }) -> $i {
  #say $i[$ind].Int;
  @out.push: $i;
}

#say "===";
#use Data::Dump;
unshift @out, @head[*;*];
#say Dump(@out);
#say @out.raku;

say "dump result to {config()<out>} file ...";

csv(in => @out,out => config()<out>);
