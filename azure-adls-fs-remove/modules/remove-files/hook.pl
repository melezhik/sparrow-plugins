my $state = get_state();

my $cnt = scalar @{$state->{files}};

set_stdout "files to remove: $cnt";

for my $f (reverse sort @{$state->{files}}) {

  run_story("remove-fs", { path => $f });

}
