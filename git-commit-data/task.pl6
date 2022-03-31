say "git commit: ", "{cache_root_dir()}/sha.txt".IO.slurp.chomp;
say "git comment: ", "{cache_root_dir()}/comment.txt".IO.slurp.chomp;


update_state({
  sha => "{cache_root_dir()}/sha.txt".IO.slurp.chomp,
  comment => "{cache_root_dir()}/comment.txt".IO.slurp.chomp
});
