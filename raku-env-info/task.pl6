say "raku env: ", "{cache_root_dir()}/raku.txt".IO.slurp;
say "====";
say "zef env: ", "{cache_root_dir()}/zef.txt".IO.slurp;


update_state({
  raku => "{cache_root_dir()}/raku.txt".IO.slurp,
  zef => "{cache_root_dir()}/zef.txt".IO.slurp
});
