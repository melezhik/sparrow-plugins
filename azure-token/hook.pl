run_story("get-token", 
  {
    tenant_id => config()->{tenant_id},
    client_id => config()->{client_id},
    client_secret => config()->{client_secret},
    output => cache_root_dir()."/token.json"
  }
);

run_story("parse-token", 
  {
    file => cache_root_dir()."/token.json"
  }
);
