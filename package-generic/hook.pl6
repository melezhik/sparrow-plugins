my $action = config()<action>;

my $list = config()<list>;

if $action eq 'install' {

  # update apk repository index	
  run_task("apk-update") if os() eq 'alpine';
	
  if $list.isa('Hash') { # a package list is given as Hash
    for %$list.keys -> $os {
      next unless $os eq os(); # install only packages for a target OS
      for $list{$os} -> $p {
        install_package($p,$os);  
      }
    }
  } else {
    for $list.split(/\s/) -> $p { # a package list is given as a string
      install_package($p,os()); 
    }
  }

}elsif( $action eq 'autoremove') {
      run_task('autoremove');
}else{
  die "unknown action: $action";
}

 sub install_package ($p, $os) {
  if  $os eq 'debian' {
    run_task 'apt-get', %( action => 'install', package => $p );
  } elsif  $os eq 'ubuntu' {
    run_task 'apt-get', %( action => 'install', package => $p  );
  } elsif  $os eq 'alpine' {
    run_task 'apk', %( action => 'install', package => $p );
  } elsif  $os eq 'minoca' {
    run_task 'opkg', %( action => 'install', package => $p );
  } elsif  $os eq 'archlinux' {
    run_task 'pacman', %( action => 'install', package => $p );
  } elsif  $os ~~ /:i centos/ {
    run_task 'yum', %( action => 'install', package => $p );
  } elsif  $os ~~ /:i amazon/ {
    run_task 'yum', %( action => 'install', package => $p );
  } elsif  $os ~~ /:i fedora/ {
    run_task 'yum', %( action => 'install', package => $p );
  } else {
    #run_task 'yum', %( action => 'install', package => $p );
    set_stdout("warning! unknown os - $os , skip package install");
  }
  return;
}


