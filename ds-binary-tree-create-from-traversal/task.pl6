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

    my $ind =  @arr($start .. $end).first($v,:k);
    say "search @arr, $start, $end, $v ==> index found $ind";
    return $ind;

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
