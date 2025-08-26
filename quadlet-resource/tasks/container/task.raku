my $location = config()<rootless> ?? "{%*ENV<HOME>}/.config/containers/systemd/" !!
"/etc/containers/systemd";

say "location: $location";

mkdir($location) if config()<rootless>;

my $resource-name = config()<templated> ?? "{config()<name>}\@.container" !! "{config()<name>}.container";

my $curr = "{$location}/{$resource-name}".IO ~~ :e ?? "{$location}/{$resource-name}".IO.slurp() !! "";

say "resource path: {$location}/{$resource-name}";

my $tmpl = "{task_dir()}/template.container".IO.slurp();  

say "template loaded: \n==\n$tmpl";

$tmpl.=subst("%containername%",config()<containername>);

if config()<hostname> {
  $tmpl.=subst("%hostname%","Hostname={config()<hostname>}");
} else {
  $tmpl.=subst("%hostname%\n","");
}

$tmpl.=subst("%description%",config()<description>);
$tmpl.=subst("%image%",config()<image>);
$tmpl.=subst("%network%",config()<network>);

if config()<environment_file> {
  $tmpl.=subst("%environment_file%","EnvironmentFile={config()<environment_file>}");
} else {
  $tmpl.=subst("%environment_file%\n","");
}

if config()<publish_port> {
  my @p;
  for config()<publish_port><> -> $i {
      push @p, $i
  }
  $tmpl.=subst("%publish_port%",@p.map({"PublishPort=$_"}).join("\n"));
} else {
  $tmpl.=subst("%publish_port%\n","");
}

if config()<volume> {
  my @p;
  for config()<volume><> -> $i {
      push @p, $i
  }
  $tmpl.=subst("%volume%",@p.map({"Volume=$_"}).join("\n"));
} else {
  $tmpl.=subst("%volume%\n","");
}

if config()<expose> {
  $tmpl.=subst("%expose%","Expose={config()<expose>}");
} else {
  $tmpl.=subst("%expose%\n","");
}

if config()<restart> {
  $tmpl.=subst("%restart%","Restart={config()<restart>}");
} else {
  $tmpl.=subst("%restart%\n","");
}


if config()<exec_reload> {
  $tmpl.=subst("%exec_reload%","ExecReload={config()<exec_reload>}");
} else {
  $tmpl.=subst("%exec_reload%\n","");
}

if config()<add_capability> {
  my @p;
  for config()<add_capability><> -> $i {
      push @p, $i
  }
  $tmpl.=subst("%add_capability%",@p.map({"AddCapability=$_"}).join("\n"));
} else {
  $tmpl.=subst("%add_capability%\n","");
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
