#!raku

run_task os(), %(
  homebrew_base => config()<homebrew_base> || "{%*ENV<HOME>}/homebrew"
);
