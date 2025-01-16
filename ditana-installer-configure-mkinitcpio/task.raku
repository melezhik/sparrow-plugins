#run_task "check";

my $path = config()<path>;

my $cfg = $path.IO.slurp();


my @req-checks = [
  {
    title => 'Check if "udev" or "systemd" is in mkinitcpio HOOKS',
    re => qq{^^ "HOOKS=" .* <?wb>  ("udev" || "systemd")  <?wb>},
    name => 'udev_systemd_check',
  },
  {
    title => 'Check if "kms" is in mkinitcpio HOOKS',
    re => qq{^^ "HOOKS=" .* <?wb>  "kms"  <?wb>},
    name => 'kms_check',
  },
  {
    title => 'Check if "filesystems" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "filesystems"  <?wb>},
    name => 'filesystems_check',
  },
];

for @req-checks -> $c {
  #say $c<title>;
  #say $c<re>;
  my $pattern = $c<re>;
  if $cfg ~~ /<mymatch=$pattern>/ {
    $c<result> = True
  } else {
    $c<result> = False
  }
}


for @req-checks -> $c {
  say "$c<name> $c<result>";
}

