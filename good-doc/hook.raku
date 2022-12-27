my $doc =  config()<path>.IO.slurp();

# very naive implimentation
# looking for the very first block
# of ``` ... ````

if $doc ~~ /'```' (\S*)(.*)'```'/ {
  "{cache_root_dir()}/code.raku".IO.spurt("$1");
  run_task "run", %(
    file  => "{cache_root_dir()}/code.raku"
  );
}
