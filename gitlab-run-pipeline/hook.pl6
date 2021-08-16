#!raku

run_task "http-request", %(
  variables => config()<variables>.keys.map({ "-F \"variables[{$_}]={config()<variables>{$_}}\"" }).join(" ")
);
