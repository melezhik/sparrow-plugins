our $NEXT;

use URI::Escape;
use strict;
 
run_task('list-repos', { page => 1 });

my $pages_max=config()->{pages_max};

my $i=0;

while ($NEXT){
  $NEXT=~/page=(\d+)/;
  run_task('list-repos', { page => $1 });
  $i++;

  if ($pages_max){
    last if $i>=$pages_max;
  }
}

for my $r (sort our @REPOS){
  set_stdout($r);
}
