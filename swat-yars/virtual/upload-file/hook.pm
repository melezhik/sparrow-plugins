run_swat_module(
    DELETE => 'file/test_file1'
);

run_swat_module(
    PUT => 'file/test_file1'
);

run_swat_module(
    GET => 'file/test_file1'
);

set_response('done');
