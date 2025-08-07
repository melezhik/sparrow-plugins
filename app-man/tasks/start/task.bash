set -e

bin=$(config bin)
pid=$(config pid)
log=$(config log)
user=$(config user)

echo "start app[$bin] log[$log] pid[$pid] ..."

0<&-

if [[ $user = "" ]]; then
  nohup $bin  1>$log 2>$log &
  pid_=$!
  echo "save PID=$pid_ to $pid ..."
  echo $pid_ > $pid
else
  echo "run as user $user";
  su - $user -c "nohup $bin  1>$log 2>$log & echo $! > $pid"
  pid_=$(cat $pid)
  echo "save PID=$pid_ to $pid ..."
fi

