run_story('dumpenv');

my $target = config()->{target} || [];
my @targets;

if (ref $target eq 'ARRAY') {
  @targets = @{$target}
}else {
  @targets = split ',', $target;
}

for my $t (@targets) {

  if ( $t eq 'update-sources' ){
    run_story('update-sources');
    next;
  }

  if ( $t eq 'wipe' ){
    run_story('wipe');
    next;
  }

  if ( $t eq 'image' ){
    run_story('image');
    next;
  }

  if ( $t eq 'os' ){
    run_story('os');
    next;
  }

  if ( $t eq 'list' ){
    run_story('list');
    next;
  }

  ($t_safe_name = $t )=~s{/}[-]g;

  run_story('make', { target => $t, target_safe_name => $t_safe_name });

}

