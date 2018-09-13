#!perl

use strict;

open(my $docker_c_list, '-|', 'docker', 'ps', '-f', 'status=exited', '-q', '--no-trunc' ) or die $!;

while (<$docker_c_list>) {
   chomp;
   run_story("rm-container", { container => $_ });
}

close($docker_c_list);

open(my $docker_im_list, '-|', 'docker', 'images', '-f', 'dangling=true', '-q', '--no-trunc' ) or die $!;

while (<$docker_im_list>) {
   chomp;
   run_story("rm-image", { image => $_ });
}

close($docker_im_list);
