class Node {

    has $.left is rw;
    has $.right is rw;
    has Int $.data;

    submethod new( $data ) {
      self.bless(:$data);
    };

}


sub printLevelOrder($root) {

  my @q;
  my @data;

  @q.unshift: $root;

  while True {
    my $i = @q.pop or last;
    push @data, $i.data;
    @q.unshift: $i.left if $i.left;
    @q.unshift: $i.right if $i.right;
    say "queue: ", @q.elems;
  }

  return @data;
}
 
say q:to /END/;

          1
        /  \
       2    3
      / \      
     4   5
    /     \
   6       7
END

my $root = Node.new(1);
$root.left = Node.new(2);
$root.right = Node.new(3);
$root.left.left = Node.new(4);
$root.left.right = Node.new(5);
$root.left.left.left = Node.new(6);
$root.left.right.right = Node.new(7);

say printLevelOrder($root).perl;

