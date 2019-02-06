use swat::app;

start_app();

run_swat_module( GET => 'hello/name', { name => 'swat' } );

1;

