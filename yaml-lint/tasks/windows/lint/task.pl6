use YAMLish;

my $file = task_var('file');

say "Parse json file [{$file}]";

load-yaml($file.IO.slurp);
