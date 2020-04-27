my $goss_scenario = config()->{"goss"};

my $dir = cache_root_dir();
open GOSS_YAML, ">", "$dir/goss.yaml" or die "can't open file $cache_dir/goss.yaml to write: $!";
print GOSS_YAML $goss_scenario;
close GOSS_YAML;
print "generated goss yaml at $dir/goss.yaml\n"
