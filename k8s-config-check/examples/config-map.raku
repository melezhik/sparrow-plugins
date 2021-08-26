task-run "cm check", "k8s-config-check", %(
  type => "configmap",
  name => "dashboard-env",
  namespace => "dashboard",
  data => [
    "note: creds for login",
    "[client_id=admin]",
    'regexp: ^^ "[client_secret=" \S+ "]" $$',
  ]
);

