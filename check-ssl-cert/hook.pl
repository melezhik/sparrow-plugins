use strict;
my @hosts = @{config()->{hosts}};

for my $h (@hosts){
  run_story "check-cert", { host => $h }
}
