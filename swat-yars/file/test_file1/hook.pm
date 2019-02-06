use common;

modify_resource( sub {

    my $r =  shift;
    $r.= ("/".md5());
    $r;

})
