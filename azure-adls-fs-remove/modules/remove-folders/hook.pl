my $state = get_state();
my $dry_run = config()->{dry_run};

my $cnt = scalar @{$state->{dirs}};

set_stdout "folders to remove: $cnt";

for my $f (reverse sort @{$state->{dirs}}) {

  if ($dry_run) {
    set_stdout("would remove $f");
  } else {
    run_story("remove-fs", { path => $f })
  }

}
