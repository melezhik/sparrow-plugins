use strict;

my $db_host = task_var('db_host');
my $db_name = task_var('db_name');
my $user = task_var('user');
my $password = task_var('password');

die unless system("sqlcmd -Q 'select 1 as status' -S $db_host,1433  -U $user -P '$password' -d $db_name") == 0;
