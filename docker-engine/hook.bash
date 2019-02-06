os=`cat /etc/*-release|grep -e ^ID=`

echo $os

case "$os" in

  "ID=debian" )
  run_story install-debian
  ;;

  "ID=ubuntu" )
  run_story install-ubuntu
  ;;


  * )

  echo unsupported platform $os

  exit 1

  ;;

esac


set_stdout docker install done

