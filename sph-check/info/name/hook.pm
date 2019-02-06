modify_resource(sub{
    my $r = shift;
    my $name = module_variable('name');
    my $v = module_variable('version');
    s[/name]{/$name} for $r;
    "$r?v=$v";
});
