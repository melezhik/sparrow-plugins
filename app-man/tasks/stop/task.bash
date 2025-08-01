set -e

bin=$(config bin)

pid=$(config pid)

fail_on_stop=$(task_var fail_on_stop)

echo "stop app[$bin] log[$log] pid[$pid] ..."

pid_=$(cat $pid)

echo "get PID=$pid_ from $pid ..."

if [[  $fail_on_stop = "False" ]]; then
  kill $pid_ || :
else
  kill $pid_
fi


echo "remove pid file $pid"

rm -rf $pid
