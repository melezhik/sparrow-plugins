my $state = get_state();

for my $f (reverse sort @{$state->{dirs}}) {

  run_story("remove-fs", { path => $f });

}
