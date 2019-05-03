use Template;

my $tt = Template->new({
    INTERPOLATE  => 1,
}) || die "$Template::ERROR\n";


my $vars = config()->{variables};
my $source = config()->{source};
my $target = test_root_dir(); $target.="/content.tmp";

$tt->process(\$source, $vars, $target) || die $tt->error(), "\n";

print "content generated at $target\n";
