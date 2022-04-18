use Data::Dumper;

my $nodes = '
          1
        /  \
       2    3
      / \      
     4   5
    /     \
   6       7
';

print $nodes;


my $N = {};

$N->{data} = 1;

$N->{left} = { data => 2 } ;

$N->{right} = { data => 3};

$N->{left}->{left} = { data => 4 };

$N->{left}->{right} = { data => 5 };

$N->{left}->{left}->{left} = { data => 6 };

$N->{left}->{right}->{right} = { data => 7 };

print Dumper($N);
my @nodes;

sub tree_len  {

    my $tree = shift;

    return 0 unless $tree->{data};

    my $a = tree_len($tree->{left});

    my $b = tree_len($tree->{right});

    return $a > $b ? $a+1 : $b+1;

}

print "tree len: ", tree_len($N);

sub traverse {

    my $tree = shift;
    my $i = shift;

    return unless $tree->{data}; # hit the bottom

    if ($i == 1) {
        print "pick up node: ", $tree->{data}, "\n";
        push @nodes, $tree->{data};
    }

    return if $i == 0;

    traverse($tree->{left},$i-1);

    traverse($tree->{right},$i-1);
}

foreach $i (1 .. tree_len($N)) {

    traverse($N,$i);

}

print "[", (join " ", @nodes), "]\n";