if (config()->{action} eq 'list-installed'){
  run_story('list-installed');
  exit;
}

my @list;

if (config()->{'pkg-list'}){
  @list = split /,/, config()->{'pkg-list'};
} else {

  @list = keys %$list;

  open(my $fh, '-|', 'opkg list') or die "can't open `opkg list` for read: $!";
  while ( my $l = <$fh>) {
    chomp $l;
    # wget - 1.15
    $l=~/^(\S+?)\s+-\s/ or next;
    push @list, $1;
  }
  close $fh;
}


my $smoke_test    = config()->{'smoke_test'};
my %bad_packages  = map { $_ => 1 } keys %{config()->{bad_packages}};

run_story("packages-snapshot");

for my $p (sort @list){
  if ($bad_packages{$p}){
    run_story("pkg/install-fail", { pkg => $p });
  } else {
    run_story("pkg/install", { pkg => $p });
    run_story("pkg/test", { pkg => $p , command => $smoke_test->{$p}->{command}});
    run_story("pkg/cleanup");
  }
}


my @s;

select(STDERR);

for my $s (Outthentic::Story::Stat->failures){
  @s = ( $s->{path}, ( join ' ', map { "$_:$s->{vars}->{$_}" } keys %{$s->{vars}} ) );
  write;
}

format STDERR_TOP =

//////////////////////////////////
/// Custom Report ( Failures ) ///
//////////////////////////////////

.

format STDERR =
@* @*
$s[0], $s[1]
.

