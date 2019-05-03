os=$(task_var os)
service=$(task_var service)

echo os: $os
echo service: $service

case $os in
debian)
  update-rc.d $service defaults || exit 1
  ;;
funtoo)
  rc-update add $service defaults || exit 1
  ;;
minoca)
  update-rc.d $service defaults || exit 1
  ;;
centos5)
  chkconfig --add $service || exit 1
  chkconfig --level 235 $service on || exit 1
  chkconfig --list $service || exit 1
  ;;
centos6)
  chkconfig --add $service || exit 1
  chkconfig --level 235 $service on || exit 1
  chkconfig --list $service || exit 1
  ;;
centos7)
  systemctl enable $service || exit 1
  ;;
archlinux)
  systemctl enable $service || exit 1
  ;;
alpine)
  rc-update add $service || exit 1
  ;;
esac

echo done
