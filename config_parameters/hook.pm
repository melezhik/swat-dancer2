use swat::dancer;

start_dancer_app();

run_swat_module( GET => 'appname' );

set_response('success');


1;

