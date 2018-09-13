use strict;
my $container = story_var('container');


system("docker rm -v $container") == 0 or die "fail to execute: docker rm -v $container";
