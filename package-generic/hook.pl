my $action=config()->{action};

my $list = config()->{list};

if ($action eq 'install'){

  # update apk repository index	
  run_story("apk-update") if os() eq 'alpine';
	
  if (ref $list and (ref $list  eq 'HASH') ){ # a package list is given as HASH
    for my $os (keys %$list) {
      next unless $os eq os(); # install only packages for a target OS
      for my $p (@{$list->{$os}}){
        install_package($p,$os);  
      }
    }
  } else {
    for my $p (split /\s/, $list ){ # a package list is given as String
      install_package($p,os());  
    }
  }

}elsif( $action eq 'autoremove') {
      run_story('autoremove');
}else{
  die "unknown action: $action";
}

sub install_package {
  my $p = shift;
  my $os = shift;
  if ( $os eq 'debian' ){
    run_story('apt-get', { action => 'install', package => $p });
  } elsif ( $os eq 'ubuntu'){
    run_story('apt-get', { action => 'install', package => $p });
  } elsif ( $os eq 'alpine'){
    run_story('apk', { action => 'install', package => $p });
  } elsif ( $os eq 'minoca'){
    run_story('opkg', { action => 'install', package => $p });
  } elsif ( $os eq 'archlinux'){
    run_story('pacman', { action => 'install', package => $p });
  } elsif ( $os =~ /centos/i ){
    run_story('yum', { action => 'install', package => $p });
  } elsif ( $os =~ /amazon/i ){
    run_story('yum', { action => 'install', package => $p });
  } elsif ( $os =~ /fedora/i ){
    run_story('yum', { action => 'install', package => $p });
  } else {
    #run_story('yum', { action => 'install', package => $p });
    set_stdout("warning! unknown os - $os , skip package install");
  }
  return;
}


