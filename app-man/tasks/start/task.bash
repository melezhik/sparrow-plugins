set -e

bin=$(config bin)
pid=$(config pid)
log=$(config log)

echo "start app[$bin] log[$log] pid[$pid] ..."

0<&-

nohup $bin  1>$log 2>$log &

pid_=$!

echo "save PID=$pid_ to $pid ..."

echo $pid_ > $pid

