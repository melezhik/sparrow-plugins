use strict;
for my $h (@{config()->{hosts}}){
  #warn $h;
  run_swat_module( GET => '/check', { host => $h  }  )
}
