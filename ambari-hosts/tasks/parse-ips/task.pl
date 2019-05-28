#!perl

use strict;

use JSON;

my @list;

for my $i (@{get_state()->{hosts}}) {

  my $file = cache_root_dir()."/host".($i->{host}).".json";

  open my $fh, $file or die "can't open file $file to read: $!";
  
  my $data = decode_json(join "", <$fh>);
  
  close $fh;


  push @list, { host => $i->{host} , ip => $data->{Hosts}->{ip} }
  
}

update_state({ hosts => \@list });


