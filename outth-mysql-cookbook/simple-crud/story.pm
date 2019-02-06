use Net::MySQL;

my $hostname    = host();
my $database    = 'mysql';
my $port        = config()->{'mysql'}{'port'};
my $user        = config()->{'mysql'}{'user'};
my $password    = config()->{'mysql'}{'password'};
 
my $mysql = Net::MySQL->new(
    hostname => $hostname,   # Default use UNIX socket
    database => $database,
    user     => $user,
    password => $password,
    port     => $port   
);


my $q = qq{drop database foo};
set_stdout($q);
$mysql->query($q);

$q = qq{create database foo};
set_stdout($q);
$mysql->query($q);
set_stdout(sprintf "Affected row: %d\n", $mysql->get_affected_rows_length);

$q = qq{create table foo.bar (name text)};
set_stdout($q);
$mysql->query($q);
set_stdout(sprintf "Affected row: %d\n", $mysql->get_affected_rows_length);

$q = qq{insert into foo.bar (name) values ('alexey') };
set_stdout($q);
$mysql->query($q);
set_stdout(sprintf "Affected row: %d\n", $mysql->get_affected_rows_length);


$q = qq{SELECT name from foo.bar};
set_stdout($q);
$mysql->query($q);

my $record_set = $mysql->create_record_iterator;
while (my $record = $record_set->each) {
    set_stdout(sprintf "Name : %s\n", $record->[0]);
}

$mysql->close;

