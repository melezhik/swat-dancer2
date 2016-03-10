use swat::app;

start_app();

run_swat_module( GET => 'hello2/name', { name => 'swat' } );


1;

