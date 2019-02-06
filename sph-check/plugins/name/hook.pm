modify_resource(sub{
    my $r = shift;
    my $tarball = module_variable('tarball');
    s{/name}[/$tarball] for $r;
    $r;
});
