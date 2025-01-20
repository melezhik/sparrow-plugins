use Sparrow6::DSL;

task-run ".", %(
   :path<config.txt>,
   :service<app>,
   enable => <tls sentry>, # enable TLS and use of Sentry for production
   disable => <debug>, # disable debug mode for production 
)
