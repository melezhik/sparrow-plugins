my $state = get_state();

my $cnt = scalar @{$state->{dirs}};

set_stdout "folders to remove: $cnt";

for my $f (reverse sort @{$state->{dirs}}) {

  run_story("remove-fs", { path => $f });

}
