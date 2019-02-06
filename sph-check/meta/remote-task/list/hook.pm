use helper;

run_swat_module(
    GET => 'api/v1/remote-task/list/',
    {
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
        list => [ 
          'baz_project,baz_task,file,outthentic,0',
          'foo_project,foo_task,foo-generic,outthentic,0'
        ]

    }
);

