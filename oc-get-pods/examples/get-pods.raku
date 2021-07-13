use Sparrow6::DSL;

my %data = task-run ".", %(
  namespace => "cats"
);

use Data::Dump;

my $j = 0;

for %data<items><>.grep({ .<metadata><name>  ~~ /'homecat'/ }) -> $i {
  say $i<metadata><name>;
  say Dump($i, :color(True));
}
