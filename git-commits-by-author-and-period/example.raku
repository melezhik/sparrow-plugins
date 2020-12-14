my %state = task-run "commits-by-authors", "git-commits-by-author-and-period";

say %state.perl;

for %state<list><> -> $i {
  say "author: {$i<author>}, commits: {$i<commits>}, email: {$i<email>}"
}
