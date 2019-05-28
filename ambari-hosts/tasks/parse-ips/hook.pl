#!perl

use strict;

for my $i (@{get_state()->{hosts}}) {

  run_task('get-host', { host => $i->{host}, output => cache_root_dir()."/host".($i->{host}).".json" } )
  #run_task('parse-host', { host => $i->{host}, output => cache_dir()."/host".($i->{host}).".json" } )

}

#update_state({ hosts => \@list });
