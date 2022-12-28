
if  config()<path>.IO ~~ :f {

  my $doc =  config()<path>.IO.slurp();

  # very naive implimentation
  # looking for the very first block
  # of ``` ... ````

  if $doc ~~ /'```' (\S*) (.+?) '```'/ {
    "{cache_root_dir()}/code.raku".IO.spurt("$1");
    run_task "run", %(
      dir => config()<path>.IO.dirname,
      file  => "{cache_root_dir()}/code.raku"
    );
  }
} else {
  set_stdout("{config()<path>} does not exist")
}

