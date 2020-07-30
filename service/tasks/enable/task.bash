set -e

os=$(task_var os)
service=$(task_var service)

echo os: $os
echo service: $service

case $os in
debian)
  update-rc.d $service defaults 
  ;;
ubuntu)
  systemctl enable $service 
  ;;
funtoo)
  rc-update add $service defaults 
  ;;
minoca)
  update-rc.d $service defaults 
  ;;
centos5)
  chkconfig --add $service 
  chkconfig --level 235 $service on 
  chkconfig --list $service 
  ;;
centos6)
  chkconfig --add $service 
  chkconfig --level 235 $service on 
  chkconfig --list $service 
  ;;
centos)
  systemctl enable $service 
  ;;
centos7)
  systemctl enable $service 
  ;;
archlinux)
  systemctl enable $service 
  ;;
alpine)
  rc-update add $service 
  ;;
esac

echo done
