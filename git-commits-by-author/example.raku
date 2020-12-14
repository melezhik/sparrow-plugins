my %state = task-run "commits-by-authors", "git-commits-by-author";

say %state.perl;

for %state<list><> -> $i {
  say "author: {$i<author>}, commits: {$i<commits>}"
}
