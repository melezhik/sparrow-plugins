os=$(task_var os)
service=$(task_var service)

echo os: $os
echo service: $service

case $os in 
archlinux)
    systemctl start $service || exit 1
    systemctl status $service && echo "{$service}" running
  ;;
centos7)
    systemctl start $service || exit 1
    systemctl status $service && echo "{$service}" running
  ;;
minoca)
    /etc/init.d/$service start && echo "{$service}" running
  ;;
funtoo) 
    rc-service $service start || exit 1
	  rc-service $service status && echo "{$service}" running
  ;;
*) 
    service $service start || exit 1
	  service $service status && echo "{$service}" running
  ;;
esac
