my $preIndex = 0;

class Node {

    has $.left is rw;
    has $.right is rw;
    has $.data;

    submethod new( $data ) {
      self.bless(:$data);
    };

}

sub search (@arr, $start, $end, $v) {

    print "search {@arr.perl}, start=$start, end=$end, value=$v ";
    my $ind =  @arr[$start .. $end].first($v,:k);
    print "==> index found: $ind \n";
    #return $ind;
    exit(0);

}

sub build-tree (@inOrder, @preOrder, $start, $end) {

  my $node = Node.new(@preOrder[$preIndex]);

  $preIndex++;  

  return $node if $start == $end;

  my $ind = search(@inOrder,$start,$end,$node.data);

  $node.left = build-tree(@inOrder,@preOrder, $start, $ind - 1);
  $node.right = build-tree(@inOrder,@preOrder, $ind + 1, $end);

  return $node;

}

say q:to /END/;

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
