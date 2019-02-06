use swat::app;
start_app();


run_swat_module(
    POST => '/logout'
);


run_swat_module(
    POST => '/login' ,
    {
        username => 'bar',
        password => 'super secret',
        return_url => '/salaries'
        
    }
);

run_swat_module(
    GET => '/salaries', 
    {
        'auth' => 1
    }
);


