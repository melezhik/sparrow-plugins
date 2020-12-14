my $period = config()<period>;

my $after = Date.new(now).earlier(day => + $period);

my $before = Date.new(now).later(:1days);

run_task "fetch-commits", %(
 before => "$before",
 after => "$after"
);

run_task "build-data";
