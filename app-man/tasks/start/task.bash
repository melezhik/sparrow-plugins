set -e

bin=$(config bin)
pid=$(config pid)
log=$(config log)
user=$(config user)
bash=$(config bash)
cwd=$(config cwd)

echo "start app[$bin] log[$log] pid[$pid] ..."

0<&-

if [[ $user = "" ]]; then
  if test "$bash" == "True"; then
    echo "bash is to true, run in bash shell"
    if test "$cwd" != ""; then
      echo "cd $cwd ..."
      cd $cwd
    fi
    nohup bash --login -c "$bin" 1>$log 2>$log &
  else
    nohup $bin 1>$log 2>$log &
  fi
  pid_=$!
  echo "save PID=$pid_ to $pid ..."
  echo $pid_ > $pid
else
  echo "run as user $user";
  su - $user -c "nohup $bin  1>$log 2>$log & echo \$! > $pid"
  pid_=$(cat $pid)
  echo "save PID=$pid_ to $pid ..."
fi

