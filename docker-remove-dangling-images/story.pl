#!perl

use strict;


open(my $docker_im_list, '-|', 'docker', 'images', -f '"dangling=true"', '-q', '--no-trunc' ) or die $!;

while (<$docker_im_list>) {
   chomp;
   run_story("rm_image", { image => $_ });
}

close($docker_im_list);
