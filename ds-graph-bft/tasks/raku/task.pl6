# BFT of DAG

use Data::Dump;

class Graph {

  has %data;

  method add ($a, $b) {
      %!data{$a} = [] unless %!data{$a}:exists;
      %!data{$a}.push: $b;
  }

  method dump {
    say Dump(%!data);
  }

  method bft ($start) {

    say "breadth first traversal starting from [$start] ...";
    say "==================================================";

    my @q; # FIFO queue 
    my @out;
    my %seen;

    @q[0] = $start; 

    while @q {
      my $next = @q.shift;
      @out.push: $next unless %seen{$next};
      %seen{$next} = 1;
      if %!data{$next}:exists {
        for %!data{$next}<> -> $i {
          @q.push: $i unless %seen{$i}
        }
      }  
    }

    return @out;

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

my @r = $g.bft(2);

say "case1: ", @r;

$g = Graph.new;

$g.add(0, 1);

$g.add(0, 3);

$g.add(1, 2);
$g.add(1, 4);

$g.add(4, 5);

$g.dump;

@r = $g.bft(0);

say "case2: ", @r;

