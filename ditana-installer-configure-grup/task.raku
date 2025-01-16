my $path = config()<path>;

my $cfg = $path.IO.slurp();

# patches

say "apply patches ...";

if config()<enable_os_prober>  {
  say 'Enable OS prober';
  $cfg ~~ s/^^ "#" \s* "GRUB_DISABLE_OS_PROBER=" .* /GRUB_DISABLE_OS_PROBER=false/;
}

say "====================";

say "changed cfg: ", $cfg;

say "====================";

say "save changes to $path ...";

$path.IO.spurt($cfg);
