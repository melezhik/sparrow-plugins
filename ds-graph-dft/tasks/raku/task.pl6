# BFT of DAG

use Data::Dump;

class Graph {

  has %data;
  has %seen;
  has @out;

  method add ($a, $b) {
      %!data{$a} = [] unless %!data{$a}:exists;
      %!data{$a}.push: $b;
  }

  method dump {
    say Dump(%!data);
  }

  method dft ($node) {

    say "depth first traversal starting from [$node] ...";
    say "================================================";

    %!seen{$node} = 1;
    @out.push: $node;
    if %!data{$node}:exists {
      for %!data{$node}<> -> $i {
        self.dft($i) unless %seen{$i}
      }
    } 

  }

  method out {
    @out
  }
}



my $g = Graph.new;

$g.add(0, 1);
$g.add(0, 2);
$g.add(2, 0);
$g.add(2, 3);
$g.add(1, 2);
$g.add(3, 3);


$g.dump;

$g.dft(2);

say $g.out;