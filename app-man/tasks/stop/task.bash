set -e

bin=$(config bin)

pid=$(config pid)

log=$(config log)

fail_on_stop=$(task_var fail_on_stop)

echo "stop app[$bin] log[$log] pid[$pid] ..."

set +e
pid_=$(cat $pid)
set -e

echo "get PID=$pid_ from $pid ..."

if [[  $fail_on_stop = "False" ]]; then
  kill $pid_ || :
else
  kill $pid_
fi


echo "remove pid file $pid"

rm -rf $pid
