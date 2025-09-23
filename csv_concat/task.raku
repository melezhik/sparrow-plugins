use Text::CSV;

my @out;
my @head;

for config()<files><> -> $f {
  my @data = csv(in => $f);
  #say @data.raku;
  @head = shift @data;
  for @data[*] -> $i {
    @out.push: $i;
  };
}

#say "===";
#use Data::Dump;
unshift @out, @head[*;*];
#say Dump(@out);
#say @out.raku;

say "dump result to {config()<out>} file ...";

csv(in => @out,out => config()<out>);
