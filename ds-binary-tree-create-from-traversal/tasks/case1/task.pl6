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

sub printInOrder($root) {

    # left child first, then parent and right child
    printInOrder($root.left) if $root.left;
    say $root.data;
    printInOrder($root.right) if $root.right;

}

sub search (@arr, $start, $end, $v) {

    print "search [$v] in {@arr[$start .. $end]} ... ";
    for $start .. $end  -> $i {
      if @arr[$i] eq $v {
        say "index found: $i";
        return $i 
      }
    }

}

sub build-tree (@inOrder, @preOrder, $start, $end) {

  #exit if $r++ >= 6;

  $r++;

  say "rec num: $r";

  return if $start > $end;

  return unless @preOrder[$preIndex];

  say "\t\tconstruct node: @preOrder[$preIndex]";

  my $node = Node.new(@preOrder[$preIndex]);

  $preIndex++;  

  if $start == $end {
    say "upss .. we reach the bottom";
    return $node; 
  }

  return unless $node.data; 

  my $ind = search(@inOrder,$start,$end,$node.data);
  
  say "deep dive, left. start=$start, end={$ind-1} |@inOrder[$start .. $ind-1]|";

  my $a = build-tree(@inOrder,@preOrder, $start, $ind - 1);

  say "data returned form left build-tree: {$a ?? $a.data !! 'Null'}";

  #return $node unless $a;

  $node.left = $a;

  say "attach {$a ?? $a.data !! 'Null'} to {$node.data} from left";

  say "deep dive, right. start={$ind+1}, end={$end} |@inOrder[$ind+1 .. $end]|";

  $a = build-tree(@inOrder,@preOrder, $ind + 1, $end);

  say "data returned form right build-tree: {$a ?? $a.data !! 'Null'}";

  #return $node unless $a;

  $node.right = $a;

  say "attach {$a ?? $a.data !! 'Null'} to {$node.data} from right";

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

#use Data::Dump;

#say Dump($root);

say "=== InOrder";
printInOrder($root);
say "===";
