# BFT of DAG

use Data::Dump;

class Graph {

  has %data;
  has @!dist;
  has @!pred;
  has @!out;
  has $!start;
  has $!target;

  method add ($a, $b) {
      %!data{$a} = [] unless %!data{$a}:exists;
      %!data{$a}.push: $b;
  }

  method dump {
    say Dump(%!data);
  }

  method find ($start,$target) {

    say "breadth first traversal starting from [$start] to [$target] ...";
    say "==================================================";

    @!pred = [];
    @!dist = [];
    @!out = [];

    $!start = $start;
    $!target = $target;

    my @q; # FIFO queue 

    my %seen;

    @q[0] = $start; 

    while @q {
      my $next = @q.shift;
      #say "process i=$next";
      @!out.push: $next unless %seen{$next};
      if @!dist[$next] {
        @!dist[$next]++
      } else {
        @!dist[$next] = 0 ;
      }
      %seen{$next} = 1;
      #say "add $next to seen ...";
      if %!data{$next}:exists {
        #say "\thandle {$next}'s childs ... |{%!data{$next}<>}|";
        for %!data{$next}<> -> $i {
          unless %seen{$i}:exists {
            #say "push $i to Q";
            @q.push: $i;
            @!pred[$i] = $next unless @!pred[$i];
          }
        }
      }
      if $next == $target {
        #say "found target=$target !";
        #say "winner: {@!pred[$next]}";
        return 
      }
    }
  }

  method out() {
    @!out
  }

  method path() {
    my @a;
    my $p = @!pred[$!target];
    my $c;
    while defined($p)  {
      @a.push: $p;
      $c = $p;
      $p = @!pred[$p]
    }
    return ((reverse @a), $!target).flat;
  }  
}


my $g = Graph.new;

$g.add(0, 1);
$g.add(0, 3);

$g.add(1, 0);
$g.add(1, 2);

$g.add(2, 1);

$g.add(3, 0);
$g.add(3, 4);
$g.add(3, 7);


$g.add(4, 3);
$g.add(4, 5);
$g.add(4, 7);
$g.add(4, 6);

$g.add(5, 4);
$g.add(5, 6);

$g.add(6, 4);
$g.add(6, 5);

$g.add(7, 3);
$g.add(7, 4);

$g.dump;

$g.find(0,5);

say "case1 path: ", $g.path();

$g.find(0,7);

say "case2 path: ", $g.path();

$g.find(2,6);

say "case3 path: ", $g.path();
