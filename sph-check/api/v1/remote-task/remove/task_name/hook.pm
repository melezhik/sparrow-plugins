modify_resource( 

  sub { 
    my $r = shift; 
    my $task_name = module_variable('task_name');
    s/task_name/$task_name/, for $r; 
    $r  
  } 

);
