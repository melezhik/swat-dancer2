use swat::dancer;

start_dancer_app();

run_swat_module( GET => 'myaction' );
run_swat_module( POST => 'myaction' );

set_response('success');


1;

