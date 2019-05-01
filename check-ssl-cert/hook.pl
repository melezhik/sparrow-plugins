use strict;
my @hosts = @{config()->{hosts}};

for my $h (@hosts){
  run_task "check-cert", { host => $h }
}
