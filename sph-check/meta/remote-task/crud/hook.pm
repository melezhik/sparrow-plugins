use helper;

# remove foo task
run_swat_module(
    POST => 'api/v1/remote-task/remove/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => "foo_project/foo_task",
    }
);

# remove bar task
run_swat_module(
    POST => 'api/v1/remote-task/remove/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => "bar_project/bar_task",
    }
);

# remove baz task
run_swat_module(
    POST => 'api/v1/remote-task/remove/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => "baz_project/baz_task",
    }
);

# create foo task
run_swat_module(
    POST => 'api/v1/remote-task/upload/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        project_name => "foo_project",
        task_name => "foo_task",
        plugin_name => "foo-generic",
        plugin_type => "outthentic",
        comment => "foo task",
    }
);

sleep 1;

# create bar task
run_swat_module(
    POST => 'api/v1/remote-task/upload/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        project_name => "bar_project",
        task_name => "bar_task",
        plugin_name => "df-check",
        plugin_type => "outthentic",
        comment => "bar task",
    }
);

sleep 1;

# create baz task
run_swat_module(
    POST => 'api/v1/remote-task/upload/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        project_name => "baz_project",
        task_name => "baz_task",
        plugin_name => "foo-generic",
        plugin_type => "outthentic",
        comment => "baz task",
    }
);

# list tasks
run_swat_module(
    GET => 'api/v1/remote-task/list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
          list => [
            'baz_project,baz_task,foo-generic,outthentic,0,baz task',
            'bar_project,bar_task,df-check,outthentic,0,bar task',
            'foo_project,foo_task,foo-generic,outthentic,0,foo task',
        ]
    }
);

# remove bar task
run_swat_module(
    POST => 'api/v1/remote-task/remove/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => "bar_project/bar_task",
    }
);

# update baz task
run_swat_module(
    POST => 'api/v1/remote-task/upload/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        project_name => "baz_project",
        task_name => "baz_task",
        plugin_name => "file",
        plugin_type => "outthentic",
    }
);

run_swat_module(
    POST => 'api/v1/remote-task/load-ini/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => 'baz_project/baz_task',
    }
);

# list tasks
run_swat_module(
    GET => 'api/v1/remote-task/list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        list => [
          'baz_project,baz_task,file,outthentic,0',
          'foo_project,foo_task,foo-generic,outthentic,0',
        ]
    }
);

# get baz task meta info
run_swat_module(
    GET => 'api/v1/remote-task/meta/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => 'melezhik/baz_project/baz_task',
        list => [
          'owner: melezhik',
          'task_name: baz_task',
          'project_name: baz_project',
          'plugin_name: file',
          'plugin_type: outthentic',
          'public_access: 0',
          'suite_ini: hello world',
        ]
    }
);

# share baz task
run_swat_module(
    POST => 'api/v1/remote-task/share/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => 'baz_project/baz_task',
    }
);


# get baz task meta info
run_swat_module(
    GET => 'api/v1/remote-task/meta/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => 'melezhik/baz_project/baz_task',
        list => [
          'owner: melezhik',
          'task_name: baz_task',
          'project_name: baz_project',
          'plugin_name: file',
          'plugin_type: outthentic',
          'public_access: 1',
          'suite_ini: hello world',
        ]
    }
);

# list tasks
run_swat_module(
    GET => 'api/v1/remote-task/list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        list => [
          'baz_project,baz_task,file,outthentic,1',
          'foo_project,foo_task,foo-generic,outthentic,0',
        ]
    }
);

# list public tasks
run_swat_module(
    GET => 'api/v1/remote-task/public-list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        list => [
          'melezhik,baz_project,baz_task,file,outthentic,1',
        ]
    }
);


# hide baz task
run_swat_module(
    POST => 'api/v1/remote-task/hide/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => 'baz_project/baz_task',
    }
);


# get baz task meta info
run_swat_module(
    GET => 'api/v1/remote-task/meta/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => 'melezhik/baz_project/baz_task',
        list => [
          'owner: melezhik',
          'task_name: baz_task',
          'project_name: baz_project',
          'plugin_name: file',
          'plugin_type: outthentic',
          'public_access: 0',
          'suite_ini: hello world',
        ]
    }
);

# list tasks
run_swat_module(
    GET => 'api/v1/remote-task/list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        list => [
          'baz_project,baz_task,file,outthentic,0',
          'foo_project,foo_task,foo-generic,outthentic,0',
        ]
    }
);

# share foo task
run_swat_module(
    POST => 'api/v1/remote-task/share/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => "foo_project/foo_task",
    }
);

# list tasks
run_swat_module(
    GET => 'api/v1/remote-task/list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        list => [
          'baz_project,baz_task,file,outthentic,0',
          'foo_project,foo_task,foo-generic,outthentic,1',
        ]
    }
);

# list public tasks
run_swat_module(
    GET => 'api/v1/remote-task/public-list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        list => [
          'melezhik,foo_project,foo_task,foo-generic,outthentic,1',
        ]
    }
);

# hide foo task
run_swat_module(
    POST => 'api/v1/remote-task/hide/task_name',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        task_name => "foo_project/foo_task",
    }
);

# list tasks
run_swat_module(
    GET => 'api/v1/remote-task/list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        list => [
          'baz_project,baz_task,file,outthentic,0,%comment%',
          'foo_project,foo_task,foo-generic,outthentic,0,foo task',
        ]
    }
);

