#!perl

use strict;

system("docker container prune -f") == 0 or die "can't execute: docker container prune -f, error: $!";
system("docker image prune -f") == 0 or die "can't execute: docker image prune -f, error: $!";


