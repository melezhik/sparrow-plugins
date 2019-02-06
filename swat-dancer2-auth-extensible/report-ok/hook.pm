use swat::app;
start_app();


run_swat_module(
    POST => '/logout'
);


run_swat_module(
    POST => '/login' ,
    {
        username => 'foo',
        password => 'new_secret',
        return_url => '/report'
        
    }
);

run_swat_module(
    GET => '/report', 
    {
        'auth' => 1
    }
);

set_response('done');

1;


