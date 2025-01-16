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

my %registers-statuses;

my @registers = [
  {
    title => 'Check if "udev" is in mkinitcpio HOOKS',
    re => qq{^^ "HOOKS=" .* <?wb>  "udev"  <?wb>},
    name => 'udev',
  },
  {
    title => 'Check if "systemd" is in mkinitcpio HOOKS',
    re => qq{^^ "HOOKS=" .* <?wb>  "systemd"  <?wb>},
    name => 'systemd',
  },
  {
    title => 'Check if "keyboard" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "keyboard"  <?wb>},
    name => 'keyboard',
  },
  {
    title => 'Check if "keymap" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "keymap"  <?wb>},
    name => 'keymap',
  },
  {
    title => 'Check if "consolefont" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "consolefont"  <?wb>},
    name => 'consolefont',
  },
  {
    title => 'Check if "encrypt" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "encrypt"  <?wb>},
    name => 'encrypt',
  },
  {
    title => 'Check if "sd-vconsole" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "sd-vconsole"  <?wb>},
    name => 'sd-vconsole',
  },
  {
    title => 'Check if "sd-encrypt" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "sd-encrypt"  <?wb>},
    name => 'sd-encrypt',
  },
  {
    title => 'Check if "zfs" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "zfs"  <?wb>},
    name => 'zfs',
  },
  {
    title => 'Check if "zfs" is in mkinitcpio MODULES',
    re => q{^^ "MODULES=" .* <?wb>  "zfs"  <?wb>},
    name => 'zfs_modules',
  },
  {
    title => 'Check if "fsck" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "fsck"  <?wb>},
    name => 'fsck',
  },
  {
    title => 'Check if "keymap" is in mkinitcpio HOOKS',
    re => q{^^ "HOOKS=" .* <?wb>  "keymap"  <?wb>},
    name => 'keymap',
  },

];

# required checks
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

# registers

for @registers -> $r {
  #say $r<re>;
  my $pattern = $r<re>;
  if $cfg ~~ /<mymatch=$pattern>/ {
    $r<result> = True
  } else {
    $r<result> = False
  }
  %registers-statuses{$r<name>} = $r<result>;
  say $r<title>, " ", $r<result>
}

# check required checks statuses

for @req-checks -> $c {
  die "{$c<name>} FAIL" unless $c<result>;
}

# patches

say "apply patches ...";

if config()<zfs_filesystem> && %registers-statuses<zfs> {
  say 'Insert "zfs" into HOOKS before "filesystems" if filesystem is zfs';
  $cfg ~~ s/^^ ( "HOOKS=" .* <?wb> ) filesystems ( <?wb> .*  ) $$/$0 zfs filesystems $1/;
}


say "====================";

say "changed cfg: ", $cfg;

say "====================";

say "save changes to $path ...";

$path.IO.spurt($cfg);
