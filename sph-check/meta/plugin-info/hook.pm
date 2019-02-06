use helper;

run_swat_module(
    POST => '/api/v1/version/name',
    {
        version => '0.000001',
        name    => 'foo-test',
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,
    }
);

run_swat_module(
    POST => '/api/v1/upload',
    {
        name    => 'foo-test',
        wanted_version => '0.001001',
        archive => 'foo-test-v0.001001.tar.gz',
        sparrow_user =>   $ENV{'sph_user'}  || config()->{api}{user}   || sph_user() ,
        sparrow_token =>  $ENV{'sph_token'} || config()->{api}{token}  || sph_token() ,

    }
);

run_swat_module(
    GET => '/info/name',
    {
        name    => 'foo-test',
        version => '0.001001',
        wanted_lines => [ '0.1.1' ]
    }
);
