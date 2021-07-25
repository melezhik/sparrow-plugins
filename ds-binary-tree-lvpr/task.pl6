class Node {

    has $.left is rw;
    has $.right is rw;
    has Int $.data;

    submethod new( $data ) {
      self.bless(:$data);
    };

}

my @data;
my $max-level = 0;

sub parseLevel($root , $level) {

    if $root.defined {
      say "run parseLevel, root={$root.data}, level=$level, max-level=$max-level";
    } else {
      say "run parseLevel, root=null, level=$level, max-level=$max-level";
    }

    if ! $root.defined {
        say "we reach the bottom!";
        return
    }

    if $level > $max-level {

      say ">> level up! $max-level => $level, node={$root.data}";
    
      @data.push: $root.data;

      $max-level = $level;

    }


    say "deep dive node={$root.data} ---> ";

    parseLevel($root.left, $level+1) if $root.left;

    parseLevel($root.right, $level+1) if $root.right;

}

sub leftView($root) {
  parseLevel($root,1)
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

leftView($root).perl;

say @data.perl;

