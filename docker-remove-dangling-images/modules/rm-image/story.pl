use strict;
my $image = story_var('image');


system("docker rmi $image") == 0 or die "fail to execute: docker rmi $image";
