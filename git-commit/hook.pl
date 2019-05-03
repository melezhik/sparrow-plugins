use strict;
my $message = config()->{message};
my $check_spell = config()->{check_spell};
my $file = cache_root_dir()."/commit.msg";

if (open my $fh, ">", $file){
  print $fh $message;
  close $fh;
  run_task("check-spell") if $check_spell;
  run_task("commit");
} else {
  set_stdout("can't open file $file to write")
}
