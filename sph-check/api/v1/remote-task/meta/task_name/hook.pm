modify_resource( 

  sub { 
    my $r = shift; 
    my $task_name = module_variable('task_name');
    s/task_name/$task_name/, for $r; 
    $r  
  } 

);


set_response_processor( sub { 

    my $headers   = shift;
    my $body      = shift;
    use JSON;
    $hash = decode_json($body);
    return 
      "owner: $hash->{owner}\n".
      "task_name: $hash->{task_name}\n".
      "project_name: $hash->{project_name}\n".
      "plugin_name: $hash->{plugin_name}\n".
      "plugin_type: $hash->{plugin_type}\n".
      "public_access: $hash->{public_access}\n".
      "suite_ini: $hash->{suite_ini}\n"
    ;
  }
)

