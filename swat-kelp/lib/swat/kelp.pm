package swat::kelp;
1;

package main;

sub start_kelp_app {

    # this code make it sure
    # that app runs 
    # only once
    # at very begining
    # of tests run

    return if -f test_root_dir()."/run.ok";

    stop_kelp_app();

    my $project_root_dir = project_root_dir();
    my $port = $ENV{port};
    my $pid_file = $ENV{pid_file};
    my $trd = test_root_dir();
	
    system("cd $project_root_dir; nohup carton exec 'plackup --host 0.0.0.0 --port $port' 2>/dev/null 1>/dev/null & echo -n \$! > $pid_file && touch $trd/run.ok");

    my $pid = get_app_pid();
    ok($pid,"kelp app is running. pid: $pid");

}

sub stop_kelp_app {

    my $pid = get_app_pid();

    if ($pid){
        `kill $pid`;
        ok(1,"stop old kelp app at pid: $pid"); 
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

