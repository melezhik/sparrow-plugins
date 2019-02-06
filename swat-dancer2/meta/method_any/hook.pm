use swat::app;

start_app();

run_swat_module( GET => 'myaction' );
run_swat_module( POST => 'myaction' );

1;

