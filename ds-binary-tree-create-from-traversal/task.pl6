my $preIndex = 0;
my $r = 0;

class Node {

    has $.left is rw;
    has $.right is rw;
    has $.data;

    submethod new( $data ) {
      self.bless(:$data);
    };

}

sub search (@arr, $start, $end, $v) {

    exit if $r++ > 10;

    print "search [$v] in {@arr[$start .. $end]} ... ";
    my $ind =  @arr[$start .. $end].first($v,:k);
    print "index found: $ind \n";
    return $ind;

}

sub printInOrder($root) {

    # left child first, then parent and right child
    printInOrder($root.left) if $root.left;
    say $root.data;
    printInOrder($root.right) if $root.right;

}

sub build-tree (@inOrder, @preOrder, $start, $end) {

  return if $start > $end;

  my $node = Node.new(@preOrder[$preIndex]);

  $preIndex++;  

  if $start == $end {
    say "upss .. we reach the bottom";
    return $node; 
  }

  return unless $node.data; 

  my $ind = search(@inOrder,$start,$end,$node.data);

  say "deep dive, start=$start, end={$ind-1} @inOrder[$start .. $ind-1]";
  $node.left = build-tree(@inOrder,@preOrder, $start, $ind - 1);

  say "deep dive, start={$ind+1}, end={$end} @inOrder[$ind+1 .. $end]";
  $node.right = build-tree(@inOrder,@preOrder, $ind + 1, $end);

  return $node;

}

say q:to /END/;

in-order  =  ['D', 'B', 'E', 'A', 'F', 'C']

pre-order =  ['A', 'B', 'D', 'E', 'C', 'F']

                A
              /   \
             /     \
           D B E   F C


                A
              /   \
             /     \
            B       C
           / \      /
          /   \    /
        D      E  F
END

my @in-order = ['D', 'B', 'E', 'A', 'F', 'C'];

my @pre-order =  ['A', 'B', 'D', 'E', 'C', 'F'];

my $root = build-tree(
  @in-order,
  @pre-order,
  0, # start 
  @in-order.elems - 1 # end
);

say "=== InOrder";
printInOrder($root);
say "===";
