
modify_resource(sub {
    my $r = shift;
    my $name = module_variable('name');
    s{name}[$name] for $r;
    $r;
});
1;


