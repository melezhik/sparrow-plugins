set_spl %( dev-user => 'https://github.com/melezhik/user.git' );

my $user = 'test';

group 'wheel';

package-install 'sshpass';

task-run "create user $user", 'dev-user', %(
  action   => 'create',
  name     => "$user",
  password => "12345",
  home_dir => "/home/$user",
  groups   => 'wheel',
);

bash "sshpass -p 12345 ssh  -o StrictHostKeychecking=no $user@127.0.0.1 'exit 0' ";

task-run "change user $user", 'dev-user', %(
  action   => 'create',
  name     => "$user",
  password => "1234567",
  home_dir => "/tmp/$user",
  groups   => 'wheel',
);

bash "sshpass -p 1234567 ssh  -o StrictHostKeychecking=no $user@127.0.0.1 'exit 0' ";
