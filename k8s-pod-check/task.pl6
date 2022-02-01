use Data::Dump;

say config().perl;

#say Dump(get_state());

say "===========================";

my $i = 0;

for "{cache_root_dir()}/data.txt".IO.lines -> $l {

  say $l if ++$i == 1;
  say $l if $l.contains(config()<name>);

};

say "===========================";

for get_state()<items><> -> $c { 

  #say Dump($c);
  #say Dump($c<status>);
 
  my $cnt-ready = $c<status><containerStatuses><>.grep(.<ready>).elems;
  my $cnt-not-ready = $c<status><containerStatuses><>.grep({! .<ready> }).elems;

  next unless $c<metadata><name>.contains(config()<name>);

  if $c<status><phase> eq "Running" 
      && $cnt-not-ready == 0 
      && $c<status><containerStatuses>.elems == $cnt-ready {
      say $c<metadata><name>, " POD_OK"
  } else {
    say $c<metadata><name>, " POD_NOT_OK"
  }
   
  #say "image=[{$c<image>}] ready=[{$c<ready>}] started=[{$c<started>}]"
}

#`{

[
  {
    containerID  => "docker://53787d7da532861e6f3bcfe7ac0ae6066e4c9bc168c90747f07945c0b342d0f1".Str,
    image        => "nginx:1.7.9".Str,
    imageID      => "docker-pullable://nginx\@sha256:e3456c851a152494c3e4ff5fcc26f240206abac0c9d794affb40e0714846c451".Str,
    lastState    => {
      terminated => {
        containerID => "docker://b56aca323aa62fdae950ea2b49fdac0e60c0aa5c3a2ef346fe4726433d9e8a3e".Str,
        exitCode    => 0.Int,
        finishedAt  => "2021-12-14T00:05:20Z".Str,
        reason      => "Completed".Str,
        startedAt   => "2021-12-13T21:05:02Z".Str,
      },
    },
    name         => "nginx".Str,
    ready        => Bool::True.Bool,
    restartCount => 1.Int,
    started      => Bool::True.Bool,
    state        => {
      running => {
        startedAt => "2022-01-29T22:24:42Z".Str,
      },
    },
  },
]
}
