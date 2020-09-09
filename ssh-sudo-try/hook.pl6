my @servers = config()<servers>.split(',');

for @servers -> $s {
    run_task "ssh-and-sudo", %( server => $s );
}
