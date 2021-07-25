class Node {

    has $.left is rw;
    has $.right is rw;
    has Int $.data;

    submethod new( $data ) {
      self.bless(:$data);
    };

}


sub printInOrder($root) {

    # left child first, then parent and right child
    printInOrder($root.left) if $root.left;
    say $root.data;
    printInOrder($root.right) if $root.right;
     
}

sub printPostOrder($root) {

    # childs first
    printPostOrder($root.left) if $root.left;
    printPostOrder($root.right) if $root.right;
    say $root.data;
     
}

sub printPreOrder($root) {

    # parent first
    say $root.data;
    printPreOrder($root.left) if $root.left;
    printPreOrder($root.right) if $root.right;
     
}
 

my $root = Node.new(1);
$root.left = Node.new(2);
$root.right = Node.new(3);
$root.left.left = Node.new(4);
$root.left.right = Node.new(5);

# =================

say q:to /END/;

          1
        /  \
       2    3
      / \      
     4   5
END


say "=== InOrder";
printInOrder($root);
say "===";

# =================

$root = Node.new(4);
$root.left = Node.new(2);
$root.right = Node.new(6);
$root.left.left = Node.new(1);
$root.left.right = Node.new(3);
$root.right.left = Node.new(5);
$root.right.right = Node.new(7);

say q:to /END/;

          4
        /   \
       2     6
      / \   /  \  
     1   3 5    7
END

say "=== InOrder2";
printInOrder($root);
say "===";

# =================

$root = Node.new(1);
$root.left = Node.new(2);
$root.right = Node.new(3);
$root.left.left = Node.new(4);
$root.left.right = Node.new(5);

say q:to /END/;

          1
        /  \
       2    3
      / \      
     4   5
END

say "=== PostOrder";
printPostOrder($root);
say "===";

# =================

say q:to /END/;

          1
        /  \
       2    3
      / \      
     4   5
END

say "=== PreOrder";
printPreOrder($root);
say "===";
