use MIME::Lite;

my $from = config()->{from};
my $to = config()->{to};
my $subject = config()->{subject};

my $msg = MIME::Lite->new(
    From    => $from,
    To      => $to,
    Subject => $subject,
    Type    => 'multipart/mixed',
);

$msg->attach(
    Type     => 'TEXT',
    Data     => join "", <STDIN>,
);

$msg->send;
