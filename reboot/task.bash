time=$(config time)

echo "about to reboot this machine in [$time] seconds ..."

0<&-

nohup bash -c "sleep $time && sudo reboot now"  1>/dev/null 2>/dev/null &
#nohup bash -c "sleep $time && echo OK"  1>/dev/null 2>/dev/null &

echo "reboot will happen in $time secs, bye!!!"
