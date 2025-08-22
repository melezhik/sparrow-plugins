my $location = config()<rootless> ?? "{%*ENV<HOME>}/.config/networks/systemd/" !!
"/etc/networks/systemd";

mkdir($location) if config()<rootless>;

my $curr = "{$location}/{config()<name>}.network".IO ~~ :e ??
"{$location}/{config()<name>}.network".IO.slurp() !! "";


my $tmpl = "{task_dir()}/template.network".IO.slurp();  

say "template loaded: \n==\n$tmpl";

$tmpl.=subst("%name%",config()<name>);
$tmpl.=subst("%subnet%",config()<subnet>);
$tmpl.=subst("%gateway%",config()<gateway>);
$tmpl.=subst("%description%",config()<description>);
$tmpl.=subst("%dns%",config()<dns>);

say "template rendered: \n==\n$tmpl";

say "===";
  
if $curr eq $tmpl {
  say "resource not changed";
  update_state(%(:!changed))
} else {
  say "resource changed";
  "{$location}/{config()<name>}.network".IO.spurt($tmpl);
  update_state(%(:changed));

}
