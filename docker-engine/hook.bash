os=`cat /etc/*-release|grep -e ^ID=`

echo $os

case "$os" in

  "ID=debian" )
  run_task install-debian
  ;;

  "ID=ubuntu" )
  run_task install-ubuntu
  ;;


  * )

  echo unsupported platform $os

  exit 1

  ;;

esac


set_stdout docker install done

