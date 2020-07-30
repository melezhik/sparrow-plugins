set -e

os=$(task_var os)
service=$(task_var service)

echo os: $os
echo service: $service

case $os in
debian)
  update-rc.d -f $service remove 
  ;;
ubuntu)
  systemctl disable $service 
  ;;
funtoo)
  rc-update del $service defaults 
  ;;
minoca)
  update-rc.d -f $service remove 
  ;;
centos5)
  chkconfig --del $service 
  chkconfig --level 235 $service off 
  chkconfig --list $service 
  ;;
centos6)
  chkconfig --del $service 
  chkconfig --level 235 $service off 
  chkconfig --list $service 
  ;;
centos)
  systemctl disable $service 
  ;;
centos7)
  systemctl disable $service 
  ;;
archlinux)
  systemctl disable $service 
  ;;
alpine)
  rc-update del $service
  ;;
esac

echo done
