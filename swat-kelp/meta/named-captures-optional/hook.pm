use swat::kelp;

start_kelp_app();

run_swat_module( GET => '/hello/name', { name => 'Kelp!!!' } );

run_swat_module( GET => '/hello/name', { name => undef } );


