#!raku

use Sparrow6::DSL;

task-run ".", %(
  name => "nginx-deployment",
  namespace => "melezhik-sandbox",
  volume-mounts => %(
    www-data => "/var/www"
  ),
  env => [
    'DEMO_GREETING',
  ],
);
