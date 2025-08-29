my $location = config()<dry_run> ?? "/tmp/"  !! "/etc/systemd/system/";

say "location: $location";

my $resource-name = "{config()<name>}.timer";

my $curr = "{$location}/{$resource-name}".IO ~~ :e ?? "{$location}/{$resource-name}".IO.slurp() !! "";

say "resource path: {$location}/{$resource-name}";

my $tmpl = "{task_dir()}/template".IO.slurp();  

say "template loaded: \n==\n$tmpl";

$tmpl.=subst("%name%",config()<name>);
$tmpl.=subst("%description%",config()<description>);

if config()<on_boot_sec> {
  $tmpl.=subst("%on_boot_sec%","OnBootSec={config()<on_boot_sec>}");
} else {
  $tmpl.=subst("%on_boot_sec%\n","");
}

if config()<on_unit_active_sec> {
  $tmpl.=subst("%on_unit_active_sec%","OnUnitActiveSec={config()<on_unit_active_sec>}");
} else {
  $tmpl.=subst("%on_unit_active_sec%\n","");
}

if config()<randomized_delay_sec> {
  $tmpl.=subst("%randomized_delay_sec%","RandomizedDelaySec={config()<randomized_delay_sec>}");
} else {
  $tmpl.=subst("%randomized_delay_sec%\n","");
}

if config()<accuracy_sec> {
  $tmpl.=subst("%accuracy_sec%","AccuracySec={config()<accuracy_sec>}");
} else {
  $tmpl.=subst("%accuracy_sec%\n","");
}

if config()<requires> {
  $tmpl.=subst("%requires%","Requires={config()<requires>}");
} else {
  $tmpl.=subst("%requires%\n","");
}

$tmpl.=subst("%targets%","timers.target");

say "template rendered: \n==\n$tmpl";

say "===";
  
if $curr eq $tmpl {
  say "resource not changed";
  update_state(%(:!changed))
} else {
  say "resource changed";
  "{$location}/{$resource-name}".IO.spurt($tmpl);
  update_state(%(:changed));

}
