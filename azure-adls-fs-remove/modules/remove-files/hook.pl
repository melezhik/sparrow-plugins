my $state = get_state();
my $dry_run = config()->{dry_run};

my $cnt = scalar @{$state->{files}};

set_stdout "files to remove: $cnt";

for my $f (reverse sort @{$state->{files}}) {

  if ($dry_run) {
    set_stdout("would remove $f");
  } else {
    run_story("remove-fs", { path => $f });
  }

}
