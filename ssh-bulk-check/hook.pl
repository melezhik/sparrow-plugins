my @hosts = @{config()->{hosts}};
my $user = config()->{user} || $ENV{USER} ||" ";
my $password = config()->{password} || "";

my $cmd = config()->{cmd};

my $state = config()->{state};

die "file $cmd does not exist" unless -f $cmd;
die "file $state does not exist" unless -f $state;


for my $i (@hosts) {
  run_story("check-host", { host => $i, cmd => $cmd , user => $user, password => $password });
}
