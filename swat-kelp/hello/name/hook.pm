modify_resource(sub{
    my $r = shift;
    my $name = module_variable('name');
    if ($name){
        s{name}[$name] for $r;
    }else{
        $r = '/hello/';
    }
    $r;
});
