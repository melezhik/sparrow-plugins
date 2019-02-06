run_swat_module(
    POST => 'mt/mt-cp.fcgi', {
        username => config()->{account}{username},
        password => config()->{account}{password}
    }
);

set_response('OK')
