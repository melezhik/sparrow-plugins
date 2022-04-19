my $nodes_s = '
           1
          / \
         2   3
        / \
       4   5
      /     \
     6       7 
';

print $nodes_s;

my $nodes = { data => 1 };

$nodes->{left} = { data => 2 };

$nodes->{right} = { data => 3 };

$nodes->{left}->{left} = { data => 4 };

$nodes->{left}->{right} = { data => 5 };

$nodes->{left}->{left}->{left} = { data => 6 };

$nodes->{left}->{right}->{right} = { data => 7 };

#use Data::Dumper;

#print Dumper($nodes);

my @q = ($nodes);
my @n;

sub traverse {

    while ( my $i = pop @q ) {
        push @n, $i->{data};
        print "pick up $i->{data}\n";
        unshift @q, $i->{left} if $i->{left};
        unshift @q, $i->{right} if $i->{right};
    }
}

traverse();

print "[", (join ",", @n), "]\n";