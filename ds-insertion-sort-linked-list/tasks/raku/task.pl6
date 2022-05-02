class LinkedList {

  has LinkedList $.next is rw;

  has LinkedList $.head is rw;

  has Int $.data;

  method TWEAK {
    self.head = self;
  }

  method push ($node) {

    say "push data: {$node.data} to list";

    $node.next = self.head;

    self.head = $node;

  }

}

my $l = LinkedList.new;

$l.push(LinkedList.new(data => 5));

$l.push(LinkedList.new(data => 20));

$l.push(LinkedList.new(data => 4));

$l.push(LinkedList.new(data => 3));

$l.push(LinkedList.new(data => 30));




my $sorted-list = LinkedList.new;

sub push-sorted ($a) {

  my $s = $sorted-list.head;
  
  say "list head: {$s.data||'NULL'}";

  if $s.data {

    if $s.data > $a {
      say "attach $a to head";
      $sorted-list.push(LinkedList.new(data => $a));
    } else {

      say "iterate over list, next is: {$s.next.data}||'NULL'";

      while $s.next.data && $s.next.data < $a {
        $s = $s.next;
      }
      my $n = LinkedList.new(data => $a, next => $s.next);
      say "insert {$a} before {$s.next.data}";
      $n.next = $s.next;
      $s.next = $n;
    }


  } else {

    say "attach $a to head - first not null element";
    $sorted-list.push(LinkedList.new(data => $a));

  }
 

}

sub insertion-sort (LinkedList $l) {

  my $s = $l.head;

  while $s.data {
    say "process {$s.data}";
    push-sorted($s.data);
    $s = $s.next;
  }

}


insertion-sort($l);

my @sorted;

my $s = $sorted-list.head;

while $s.data {
  say ">> {$s.data}";
  @sorted.push: $s.data;
  $s = $s.next;
}


say "sorted1: {@sorted}";