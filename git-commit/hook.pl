use strict;
my $message = config()->{message};
my $file = cache_root_dir()."/commit.msg";

if (open my $fh, ">", $file){
  print $fh $message;
  close $fh;
  run_story("commit");
} else {
  set_stdout("can't open file $file to write")
}
