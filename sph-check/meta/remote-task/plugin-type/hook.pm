use helper;

# remove foo task
run_swat_module(
    POST => 'api/v1/remote-task/remove/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => "foo_project/t1_task",
    }
);

# create foo task
run_swat_module(
    POST => 'api/v1/remote-task/upload/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        project_name => "foo_project",
        task_name => "t1_task",
        plugin_name => "foo-generic",
        plugin_type => "outthentic",
        comment => "t1 task",
    }
);

# list tasks
run_swat_module(
    GET => 'api/v1/remote-task/list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
          list => [
            'foo_project,t1_task,foo-generic,outthentic,0,t1 task',
        ]
    }
);

# update t1 task
run_swat_module(
    POST => 'api/v1/remote-task/upload/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        project_name => "foo_project",
        task_name => "t1_task",
        plugin_name => "swat-test",
        plugin_type => "swat",
        comment => "t1 task",
    }
);

# list tasks
run_swat_module(
    GET => 'api/v1/remote-task/list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
          list => [
            'foo_project,t1_task,swat-test,swat,0,t1 task',
        ]
    }
);
