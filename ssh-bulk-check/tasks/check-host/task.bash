#!bash

echo "check host [$host] ..."

if test "$host" = "localhost"; then
  cat $cmd | bash
elif test -z $password; then
    cat $cmd | ssh $host -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
else
  if test -z $user; then
    cat $cmd | sshpass -p $password ssh $host -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
  else
    cat $cmd | sshpass -p $password ssh -l $user $host -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
  fi
fi

echo "end check host [$host]"
