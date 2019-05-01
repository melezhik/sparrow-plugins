use Net::Ping;

my $host =  config()->{host};

my $p = Net::Ping->new();


if ($p->ping($host)){
  print "<$host> is alive (default ping).\n";
  $p->close();
  exit();
}

$p = Net::Ping->new('tcp',2);

$p->port_number(scalar(getservbyname("http", "tcp")));

while ($i++ <=4)
{
    if ($p->ping($host)){
      print "<$host> is alive (http port).\n";
      $p->close();
      exit;
    }
    sleep(1);
}
undef($p);

 
