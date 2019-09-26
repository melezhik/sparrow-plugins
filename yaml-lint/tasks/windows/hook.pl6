my $files = config()<files>;

for $files -> $i {
  run_task "windows/lint", %(file => $i)
}

