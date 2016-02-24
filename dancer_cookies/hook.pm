use swat::dancer;

start_dancer_app();

run_swat_module( GET => 'cookie' );

set_response('success');


1;

