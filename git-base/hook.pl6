my $install_git= config()<install_git>;

if $install_git eq "on" {

  if os() ~~ "debian" {
    run_task 'install-debian';
  } elsif os() ~~ "ubuntu" {
    run_task 'install-debian';
  } elsif os() ~~ "centos" {
    run_task 'install-centos';
  } elsif os() ~~ "minoca" {
    run_task 'install-minoca';
  } else {
    die "unsupported platform {os()}"
  }
  
}


if os() eq  'windows' {
  run_task("git-setup/windows");
} else {
  run_task("git-setup/linux");
}

