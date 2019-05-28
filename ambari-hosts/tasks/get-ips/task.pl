#!perl

use strict;
use JSON;

my $json = task_var('json');
my $node_type = config()->{node_type};

open my $fh, $json or die "can't open file $json to read: $!";

my $data = decode_json(join "", <$fh>);

close $fh;

my @list;

for my $i (@{$data->{items}}) {

  if ($node_type && $node_type eq 'worker'){

    push @list, $i->{host_name} if $i->{host_name} =~ /^wn/;

  } elsif ($node_type && $node_type eq 'zoo_keeper') {

    push @list, $i->{host_name} if $i->{host_name} =~ /^zk/;

  } elsif ($node_type && $node_type eq 'head') {

    push @list, $i->{host_name} if $i->{host_name} =~ /^hn/;

  } else {

    push @list, $i->{host_name};

  }

}

update_state({ hosts => \@list });
