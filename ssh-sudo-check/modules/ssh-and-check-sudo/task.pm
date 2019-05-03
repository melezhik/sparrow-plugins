my $ssh_command = config()->{ssh_command};
my $server = task_var('server');
my $user = task_var('user');

my $command = "$ssh_command $server id $user -Gn 2>\&1";

set_stdout($command);
set_stdout(`$command`);

