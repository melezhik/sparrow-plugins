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

sub printLevelOrder($root) {
  my $h = height($root);
  for (1 .. $h+1) -> $i {
      say "i=[$i]";
      printCurrentLevel($root, $i)
  }
}
 
# Print nodes at a current level
sub printCurrentLevel($root , $level) {

    if $root.defined {
      say "run printCurrentLevel, root={$root.data}, level=$level";
    } else {
      say "run printCurrentLevel, root=null, level=$level";
    }

    if ! $root.defined {
        say "we reach the bottom!";
        return
    } 

    if $level == 1 {
        
        say ">> boom! .................. next node is: [", $root.data, "]";
        say "return from printCurrentLevel, buy-buy!";

    } elsif ( $level > 1 ) {

        say "deep dive $level => {$level-1}";

        printCurrentLevel($root.left, $level-1);

        printCurrentLevel($root.right, $level-1);

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

