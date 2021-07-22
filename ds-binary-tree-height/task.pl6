class Node {

    has $.left is rw;
    has $.right is rw;
    has Int $.data;

    submethod new( $data ) {
      self.bless(:$data);
    };

}

sub height($node) {

  if ! $node.defined {
      return 0
  } else {

      # Compute the height of each subtree
      my $lheight = height($node.left);
      my $rheight = height($node.right);

      #Use the larger one
      if $lheight > $rheight {
          return $lheight+1
      } else {
          return $rheight+1
      }
  }

}

my $root = Node.new(1);
$root.left = Node.new(2);
$root.right = Node.new(3);
$root.left.left = Node.new(4);
$root.left.right = Node.new(5);

say "height: ", height($root);
