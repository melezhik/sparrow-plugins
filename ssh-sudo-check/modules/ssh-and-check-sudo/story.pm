my $ssh_command = config()->{ssh_command};
my $server = story_var('server');
my $user = story_var('user');

my $command = "$ssh_command $server id $user -Gn 2>\&1";

set_stdout($command);
set_stdout(`$command`);

