class Node {

    has $.left is rw;
    has $.right is rw;
    has Int $.data;

    submethod new( $data ) {
      self.bless(:$data);
    };

}


sub printInOrder($root) {

    printInOrder($root.left) if $root.left;
    say $root.data;
    printInOrder($root.right) if $root.right;
     
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

say "=== InOrder";
printInOrder($root);
say "===";
