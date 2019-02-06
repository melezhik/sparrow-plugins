use strict;

my $db_host = story_var('db_host');
my $db_name = story_var('db_name');
my $user = story_var('user');
my $password = story_var('password');

die unless system("sqlcmd -Q 'select 1 as status' -S $db_host,1433  -U $user -P '$password' -d $db_name") == 0;
