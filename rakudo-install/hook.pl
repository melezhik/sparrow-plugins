my $ search= config()->{search};

if ($search) {
  run_task("list-available");
  exit;
}

my $os  = os();
my $url = config()->{url} || config()->{os_url}->{$os};

my $file = $url; s{.*/(.*)}[$1] for $file;

while (1){

  if ($os =~ /(centos|debian|ubuntu|alpine|fedora)/) {
    my $os_short = $1;  
    run_task("/download", { url => $url, file => $file })->{status} or last;
    run_task("/install/$os_short/", { file => $file })->{status} or last; 
    last;
  } elsif ( $os =~ 'archlinux' ) {
    my $repo = config()->{repo}->{$os};
    run_task("/install/$os/", { repo => $repo }) or last;
    last;
  } else {
    set_stdout("os $os not supported");
    exit 1;
  }
}
