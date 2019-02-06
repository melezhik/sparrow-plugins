set_response_processor( sub {

    my $headers   = shift;
    my $body      = shift;
    use JSON;
    $list = decode_json($body);
    return 
      "[\n".( 
        join "\n", map { 
            join ",",  @{$_}{ qw(owner project_name task_name plugin_name plugin_type public_access) }   
          } @{$list} 
        )."\n]"
  }
)

