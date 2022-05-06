class Node {

  has Int  $.data is rw;
  has Node $.next is rw;
  
}

class LinkedList {

  has Node $.head is rw;

  method push (Node $node) {

    say "push data: {$node.data} to list";

    $node.next = self.head;

    self.head = $node;

  }

  method as-array {

    my $s = self.head;
    my @l;

    while $s {
      @l.push: $s.data;
      $s = $s.next;
    }
    return @l
  }
}

my $l = LinkedList.new;

$l.push(Node.new(data => 5));

$l.push(Node.new(data => 20));

$l.push(Node.new(data => 4));

$l.push(Node.new(data => 3));

$l.push(Node.new(data => 30));

say $l.as-array;

my $sorted-list = LinkedList.new;

sub push-sorted ($a) {

  my $s = $sorted-list.head;
  
  say "list head: {$s||'NULL'}";

  if $s {

    if $s.data > $a {
      say "attach $a to head";
      $sorted-list.push(Node.new(data => $a));
    } else {

      say "iterate over list, next is: {$s.next.data}||'NULL'";

      while $s.next.data && $s.next.data < $a {
        $s = $s.next;
      }
      my $n = Node.new(data => $a);
      say "insert {$a} before {$s.next.data}";
      $n.next = $s.next;
      $s.next = $n;
    }


  } else {

    say "attach $a to head - first not null element";
    $sorted-list.push(Node.new(data => $a));

  }
 

}

sub insertion-sort (LinkedList $l) {

  for $l.as-array -> $i {
    say "process {$i}";
    push-sorted($i);
  }

}

insertion-sort($l);

say "sorted1: {$sorted-list.as-array}";