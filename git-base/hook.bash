install_git=$(config install_git)

if test $install_git = "on"; then

  shopt -s nocasematch;
  
  if [[ $os =~ "debian" ]]; then
    run_story install-debian
  elif [[ "$os" =~ "ubuntu" ]]; then
    run_story install-debian
  elif [[ "$os" =~ "centos" ]]; then
    run_story install-centos
  elif [[ "$os" =~ "minoca" ]]; then
    run_story install-minoca
  else
    echo unsupported platform $os
  exit 1
  fi
  
fi


