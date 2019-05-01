ps -eo pid,cmd,etime |grep nginx:|grep master || exit 2
