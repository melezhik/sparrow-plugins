my $goss_scenario = config()->{"goss"};

my $cache_dir = task_var('cache_dir');
open GOSS_YAML, ">", "$cache_dir/goss.yaml" or die "can't open file $cache_dir/goss.yaml to write: $!";
print GOSS_YAML $goss_scenario;
close GOSS_YAML;
print "generated goss yaml at $cache_dir/goss.yaml\n"
