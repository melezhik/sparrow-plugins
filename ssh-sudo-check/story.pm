my $servers = config()->{servers};
my $users   = config()->{users};

for my $s (split /,/, $servers){
  for my $u (split /,/, $users){
    run_story("ssh-and-check-sudo", { server => $s, user => $u } );
  }
}


set_stdout("done");
