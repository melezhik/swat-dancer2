package swat::dancer;
1;

package main;

sub start_dancer_app {

    my $project_root_dir = project_root_dir();

    my $pid_file = $ENV{pid_file};

    return if -f test_root_dir()."/run.ok";

    stop_dancer_app();

    system("cd $project_root_dir && ".
    "export project_root_dir=$project_root_dir &&".
    "nohup carton exec nohup plackup ".
    "--host 0.0.0.0 --port $ENV{port} ".
    "--access-log ".test_root_dir()."/access.log ".
    "--error-log ".test_root_dir()."/error.log ".
    'app.psgi 1>/dev/null 2>/dev/null & echo $! > '.$pid_file).
    " && touch ".test_root_dir()."/run.ok";

    my $pid = get_app_pid();

    ok($pid,"dancer is running . pid: $pid");

}


sub stop_dancer_app {

    my $pid = get_app_pid();

    chomp $pid;

    return unless $pid=~/^\d+$/;

    ok($pid, "killing dancer app at pid $pid ...");

    system("kill $pid") ;

}

sub get_app_pid {

    my $pid;

    my $pid_file = $ENV{pid_file};

    if (open F, $pid_file){
        $pid = <F>;
        close F;
    }

    return $pid;
}

1;

