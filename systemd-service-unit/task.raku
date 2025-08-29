my $location = config()<dry_run> ?? "/tmp/"  !! "/etc/systemd/system/";

say "location: $location";

my $resource-name = "{config()<name>}.service";

my $curr = "{$location}/{$resource-name}".IO ~~ :e ?? "{$location}/{$resource-name}".IO.slurp() !! "";

say "resource path: {$location}/{$resource-name}";

my $tmpl = "{task_dir()}/template".IO.slurp();  

say "template loaded: \n==\n$tmpl";

$tmpl.=subst("%name%",config()<name>);
$tmpl.=subst("%description%",config()<description>);

if config()<environment_file> {
  $tmpl.=subst("%environment_file%","EnvironmentFile={config()<environment_file>}");
} else {
  $tmpl.=subst("%environment_file%\n","");
}

if config()<environment> {
  my @p;
  for config()<environment><> -> $i {
      push @p, $i
  }
  $tmpl.=subst("%environment%",@p.map({"Environment=$_"}).join("\n"));
} else {
  $tmpl.=subst("%environment%\n","");
}

if config()<exec_start> {
  $tmpl.=subst("%exec_start%","ExecStart={config()<exec_start>}");
} else {
  $tmpl.=subst("%exec_start%\n","");
}

$tmpl.=subst("%label%",config()<label>);

$tmpl.=subst("%targets%",config()<rootless> ?? "default.target" !! "multi-user.target default.target");

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
