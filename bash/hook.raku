my $envvars = config()<envvars>;
my @envvars;

if $envvars {
  for $envvars.keys -> $e {
    push @envvars, "export $e={$envvars{$e}}; ";
  }
}

run_task(
  "bash-command",
  %(
    envvars => @envvars.join(" ")
  )
)

