os=$(task_var os)
service=$(task_var service)

echo os: $os
echo service: $service

case $os in
debian)
  update-rc.d -f $service remove || exit 1
  ;;
funtoo)
  rc-update del $service defaults || exit 1
  ;;
minoca)
  update-rc.d -f $service remove || exit 1
  ;;
centos5)
  chkconfig --del $service || exit 1
  chkconfig --level 235 $service off || exit 1
  chkconfig --list $service || exit 1
  ;;
centos6)
  chkconfig --del $service || exit 1
  chkconfig --level 235 $service off || exit 1
  chkconfig --list $service || exit 1
  ;;
centos7)
  systemctl disable $service || exit 1
  ;;
archlinux)
  systemctl disable $service || exit 1
  ;;
alpine)
  rc-update del $service
  ;;
esac

echo done
