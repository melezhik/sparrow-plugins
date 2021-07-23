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

  @q.unshift: $root;

  while True {
    my $i = @q.pop or last;
    say $i.data;
    @q.unshift: $i.left if $i.left;
    @q.unshift: $i.right if $i.right;
  }
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

printLevelOrder($root);

