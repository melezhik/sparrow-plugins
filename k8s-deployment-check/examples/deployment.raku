#!raku

use Sparrow6::DSL;

task-run ".", %(
  name => "nginx-sandbox",
  namespace => "default",
  volume-mounts => %(
    shared-files => "/usr/share/nginx\@html"
  ),
  env => [
    'DEMO_GREETING',
  ],
);
