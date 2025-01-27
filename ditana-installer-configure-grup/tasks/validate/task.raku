my $path = config()<path>;

say "validate config {$path} ...";

say ">>>";

my @out;

for $path.IO.lines -> $i {
  $i.chomp;
  next unless $i ~~ /\S+/;
  @out.push("[$i]") unless $i ~~ /^ \s* '#'/;
};

say sort(@out).join("\n");
say "<<<";
