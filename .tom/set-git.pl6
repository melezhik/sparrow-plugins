task-run "set git", "git-base", %(
  email => 'melezhik@localhost',
  name  => 'Alexey Melezhik',
  config_scope => 'global',
  set_credential_cache => 'on'
);
