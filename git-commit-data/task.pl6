say "git commit: ", "{cache_root_dir()}/sha.txt".IO.slurp;
say "====";
say "git comment: ", "{cache_root_dir()}/comment.txt".IO.slurp;


update_state({
  sha => "{cache_root_dir()}/sha.txt".IO.slurp,
  comment => "{cache_root_dir()}/comment.txt".IO.slurp
});
