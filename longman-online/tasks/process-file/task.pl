use File::Basename;
use File::Copy;
use strict;

my $example = task_var("example");
my $url = task_var("url");
my $fbname = basename($url);
my $word = config()->{word};
my $topic = config()->{topic};

#s/\W/ /g for $example;

my $in = "/home/$ENV{USER}/longman-online/$word/mp3/$fbname";
my $out = "/home/$ENV{USER}/longman-online/__".$topic."__/"."$word/$example.mp3";

copy ($in, $out) or die "can't copy file $in -> $out : $!";
