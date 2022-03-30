use JSON::Tiny;

if config()<parameters> && config()<parameters>.isa(Hash) {
 "{cache_root_dir()}/parameters.json".IO.spurt(
    to-json( %( parameters => config()<parameters> ) )
  );
  run_task "deploy", %( parameters => "{cache_root_dir()}/parameters.json" );
} elsif config()<parameters> && config()<parameters>.IO ~~ :f {
  run_task "deploy" %( parameters => config()<parameters>);
} else {
  die "parameters are not set or parameters file does not exist"
}
