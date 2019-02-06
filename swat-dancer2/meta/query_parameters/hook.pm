use swat::app;

start_app();

run_swat_module( GET => 'hello2/who', { name => 'perl' } );


1;

