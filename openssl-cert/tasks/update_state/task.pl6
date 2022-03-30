update_state(%(
  key => "{cache_root_dir()}/key".IO.slurp,
  cert => "{cache_root_dir()}/cert".IO.slurp
));
