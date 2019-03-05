my $state = get_state();

for my $f (sort @{$state->{files}}) {

  run_story("remove-fs", { path => $f });

}
