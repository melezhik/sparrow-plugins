my $location = config()<rootless> ?? "{%*ENV<HOME>}/.config/containers/systemd/" !!
"/etc/containers/systemd";

say "location: $location";

mkdir($location) if config()<rootless>;

my $curr = "{$location}/{config()<name>}\@.container".IO ~~ :e ??
"{$location}/{config()<name>}\@.container".IO.slurp() !! "";

my $tmpl = "{task_dir()}/template.container".IO.slurp();  

say "template loaded: \n==\n$tmpl";


$tmpl.=subst("%containername%",config()<containername>);
$tmpl.=subst("%hostname%",config()<hostname>);
$tmpl.=subst("%description%",config()<description>);
$tmpl.=subst("%image%",config()<image>);
$tmpl.=subst("%network%",config()<network>);
$tmpl.=subst("%port%",config()<port>);
$tmpl.=subst("%label%",config()<label>);
$tmpl.=subst("%targets%",config()<rootless> ?? "default.target" !! "multi-user.target default.target");

say "template rendered: \n==\n$tmpl";

say "===";
  
if $curr eq $tmpl {
  say "resource not changed";
  update_state(%(:!changed))
} else {
  say "resource changed";
  "{$location}/{config()<name>}\@.container".IO.spurt($tmpl);
  update_state(%(:changed));

}
