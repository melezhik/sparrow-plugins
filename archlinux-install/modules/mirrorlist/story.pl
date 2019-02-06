use strict;
use warnings;
my $mirrorlist = '/etc/pacman.d/mirrorlist';

my $servers = config()->{mirrorlist}->{servers};


if ( ref $servers eq 'ARRAY'){
  open("", '>', $mirrorlist);
  for my $url (@$servers){
  open(my $server, '>>', $mirrorlist) or die;
  print $server "Server = $url\n";
  }
}else{
  open( my $server, '>', $mirrorlist) or die;
  print $server "Server = $servers";
}

close $mirrorlist;
