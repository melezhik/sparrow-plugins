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


my $q = qq{SELECT Host,User FROM user WHERE User='root' AND Host='127.0.0.1'};

set_stdout($q);

$mysql->query($q);

my $record_set = $mysql->create_record_iterator;
while (my $record = $record_set->each) {
    set_stdout(sprintf "Host : %s User: %s\n", $record->[0], $record->[1]);
}

my $q = qq{SELECT Host,User FROM user WHERE User='root' AND Host='localhost'};

set_stdout($q);

$mysql->query($q);

my $record_set = $mysql->create_record_iterator;
while (my $record = $record_set->each) {
    set_stdout(sprintf "Host : %s User: %s\n", $record->[0], $record->[1]);
}

$mysql->close;

