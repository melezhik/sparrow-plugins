if os() eq "debian" {
  run_task "install-debian"
} elsif os() eq "ubuntu" {
  run_task "install-ubuntu"
}
