use swat::app;

start_app();

run_swat_module( GET => 'static/file' );

set_response('success');


1;

