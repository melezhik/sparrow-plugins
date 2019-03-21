run_story("get-tocken", 
  {
    tenant_id => config()->{tenant_id},
    client_id => config()->{client_id},
    client_secret => config()->{client_secret},
    output => cache_root_dir()."/token.json"
  }
);
