my $servers = config()->{servers};

for my $s (split /,/, $servers){
    run_story("ssh-and-sudo", { server => $s } );
}
