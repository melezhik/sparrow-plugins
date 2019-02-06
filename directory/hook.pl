#!perl

use strict;

my $action = config()->{action};

if ( os() eq 'windows'){
  run_story("windows/$action")
} else {
  run_story("linux/$action")
}
