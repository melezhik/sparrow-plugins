set_spl %( dev-user => 'https://github.com/melezhik/user.git' );

my $user = 'sparrow';

group 'wheel';

task-run "create user $user", 'dev-user', %(
  action   => 'create',
  name     => "$user",
  uid      => '4000',
  home_dir => "/home/$user",
  groups   => 'wheel',
);

task-run "change user $user", 'dev-user', %(
  name     => "$user",
  uid      => '4005',
  home_dir => "/tmp/$user",
  groups   => 'wheel',
);

task-run "remove user $user", 'dev-user', %(
  action   => 'delete',
  name     => "$user",
);
