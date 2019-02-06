package swat::app;

package main;

sub start_app {

    # this code make it sure
    # that app runs
    # only once
    # at very begining
    # of tests run

    return if -f test_root_dir()."/run.ok";

    stop_app();

    my $project_root_dir = project_root_dir();
    my $port = $ENV{port};
    my $pid_file = $ENV{pid_file};
    my $trd = test_root_dir();

    my $cmd = "cd $project_root_dir; nohup carton exec 'plackup --host 0.0.0.0 --port $port' 2>/dev/null 1>/dev/null & echo -n \$! > $pid_file && touch $trd/run.ok";

    note("try to run app as: $cmd");

    system($cmd);

    my $pid = get_app_pid();

    ok($pid,"app is running. pid: $pid");

}

sub stop_app {

    my $pid = get_app_pid();

    if ($pid){
        `kill $pid`;
        ok(1,"terminated old app instance by pid: $pid");
    }

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

