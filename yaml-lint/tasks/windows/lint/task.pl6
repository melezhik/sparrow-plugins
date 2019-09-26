use YAMLish;

my $file = task_var('file');

say "Parse yaml file [{$file}]";

load-yaml($file.IO.slurp);
