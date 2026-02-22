my $new-commit = config()<DSCI_COMMIT>;
my $old-commit = config()<DSCI_COMMIT>;

if "{%*ENV<HOME>}/sparrow-plugins.commit".IO ~~ :e {
  $old-commit = "{%*ENV<HOME>}/sparrow-plugins.commit".IO.slurp || config()<DSCI_COMMIT>;
}

my %state = task-run "get git change", "git-updated-dirs", %(
  dir => "../",
  commit_new => $new-commit,
  commit_old => $old-commit,
  level => 0,
);

for %state<list><> -> $i {
  say "process [{$i} -> [{$i.IO.basename}]]";   
  bash "pwd && ls -l && s6 --upload && s6 --index-update", %( 
    cwd => "{$*CWD}/../{$i.IO.basename}", 
    envvars => %( SP6_REPO => "file://{%*ENV<HOME>}/repo" ) 
  );
};

"{%*ENV<HOME>}/sparrow-plugins.commit".IO.spurt($new-commit);
