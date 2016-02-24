use swat::app;

start_app();

run_swat_module( GET => 'hello/name' );

set_response('success');


1;

