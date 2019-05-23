os=$(task_var os)
service=$(task_var service)

echo os: $os
echo service: $service

case $os in 
archlinux)
    systemctl stop $service || exit 1
    systemctl status $service 
    if [[ $? == 3 ]]; then echo " {$service} stopped" ; fi
  ;;
centos7)
    systemctl stop $service || exit 1
    systemctl stop $service && echo "{$service}" stopped
  ;;
minoca)
    /etc/init.d/$service stop && echo "{$service}" stopped
  ;;
funtoo)
    rc-service $service stop || exit 1
    rc-service $service status || echo "{$service}" stopped
  ;;
*) 
    service $service stop || exit 1
    service $service status || echo "{$service}" stopped
  ;;
esac
