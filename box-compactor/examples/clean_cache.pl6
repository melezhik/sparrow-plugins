set_spl (dev-box-compactor => 'https://github.com/Spigell/box-compactor.git');


task_run 'clean cache', 'dev-box-compactor', %(
  clean_cache => 'true',
  zero_disk   => 'false',
  debug       => 'true'
);
