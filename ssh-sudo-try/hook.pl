my $servers = config()->{servers};

for my $s (split /,/, $servers){
    run_task("ssh-and-sudo", { server => $s } );
}
