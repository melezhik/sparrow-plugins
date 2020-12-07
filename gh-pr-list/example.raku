my %state = task-run "open pr", "gh-pr-list", %(
  state => "open"
);

say %state<list>;
