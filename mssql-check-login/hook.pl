#!perl

use strict;

my $dsn = config()->{dsn};
my $user = config()->{user};
my $password = config()->{pass};
my $db_host = config()->{db_host};
my $db_name = config()->{db_name};


# Data Source=localhost;Initial Catalog=database01;User ID=user01;Password=secret;Encrypt=True;Connection Timeout=60;

if ($dsn){ 
   set_stdout "parsing dsn ...\n"; 
   my %dsn = $dsn=~/(.*?)=(.*?);/g; 
   ($db_host,$db_name,$user,$password) = @dsn{'Data Source','Initial Catalog', 'User ID', 'Password'};
   $db_host ||= $dsn{Server};
}


set_stdout "checking login:\n";
set_stdout "db host: $db_host\n";
set_stdout "db name: $db_name\n";
set_stdout "db user: $user\n";
set_stdout "password: $password\n";

run_task("check", { db_host => $db_host, db_name => $db_name, user => $user, password => $password });
