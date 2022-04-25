class Node {

    has $.left is rw;
    has $.right is rw;
    has Int $.data;

    submethod new( $data ) {
      self.bless(:$data);
    };

}



sub printLeftViewFIFO($root) {

  my @q;
  my @data;

  @q.unshift: $root;

  while True {

    my $z = @q.elems or last;

    for 1 .. $z -> $j {

      my $i = @q.pop;

      @q.unshift: $i.left if $i.left;
      @q.unshift: $i.right if $i.right;

      @data.push: $i.data if $j == 1;
      
    }

  }

  return @data;

}
 
say q:to /END/;

          1
        /  \
       2    3
      / \      
     4   5
END

my $root = Node.new(1);
$root.left = Node.new(2);
$root.right = Node.new(3);
$root.left.left = Node.new(4);
$root.left.right = Node.new(5);

say "leftsubtreeFIFO: ", printLeftViewFIFO($root).perl;

my $max = 0;
my $current = 1;

my @data;

sub TraverseLeftViewRecusrive ($root,$current) {

  if $current > $max {
    $max = $current;
    @data.push: $root.data;
  }

  TraverseLeftViewRecusrive($root.left, $current + 1) if $root.left;
  
  TraverseLeftViewRecusrive($root.right, $current + 1) if $root.right;

}

TraverseLeftViewRecusrive($root,$current);

say "TraverseLeftViewRecusrive: ", @data.perl;



