set_spl (dev-box-compactor => 'https://github.com/Spigell/box-compactor.git');

task_run 'zero space', 'dev-box-compactor', %(
  clean_cache => 'false',
  zero_disk   => 'true',
  debug       => 'true'
);
