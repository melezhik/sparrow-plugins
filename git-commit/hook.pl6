#!perl6

my $message = config()<message>;
my $check_spell = config()<check_spell>;
my $file = "{cache_root_dir()}/commit.msg";

my $fh = open $file, :w;

$fh.say($message);
$fh.close;

run_task("check-spell") if $check_spell;

if os() eq 'windows' {

  run_task("{os()}/commit");

} else {

  run_task("linux/commit");

}
