package swat::dancer;
1;

package main;

sub start_dancer_app {

    my $project_root_dir = project_root_dir();

    return if -f test_root_dir()."/run.ok";

    system("cd $project_root_dir && ".
    "export project_root_dir=$project_root_dir &&".
    "nohup carton exec nohup plackup ".
    "--host 0.0.0.0 --port $ENV{port} ".
    "--access-log ".test_root_dir()."/access.log ".
    "--error-log ".test_root_dir()."/error.log ".
    'app.psgi 1>/dev/null 2>/dev/null & echo $! > /tmp/app.pid ').
    "&& touch ".test_root_dir()."/run.ok";

    my $pid = get_app_pid();

    ok($pid,"dancer is running . pid: $pid");

}


sub stop_dancer_app {

    my $pid = get_app_pid();
    chomp $pid;
    return unless $pid=~/^\d+$/;
    ok($pid, "killing dancer app at pid $pid ...");
    system("ps --pid $pid --no-headers | grep $pid -q && kill $pid 1>/dev/null 2>/dev/null") ;
}

sub get_app_pid {
    my $pid;
    if (open F, "/tmp/app.pid"){
        $pid = <F>;
        close F;
    }
    return $pid;
}

1;

