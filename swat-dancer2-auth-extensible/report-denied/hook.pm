use swat::app;
start_app();

run_swat_module(
    POST => '/logout'
);


run_swat_module(
    GET => '/report', 
    {
        'auth' => 0
    }
);

set_response('done');

1;


