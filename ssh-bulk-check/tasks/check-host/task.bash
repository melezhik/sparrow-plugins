#!bash

echo "check host [$host]"
echo "=========================================================="

if test "$host" = "localhost"; then
  cat $cmd | bash
elif test -z $password; then
    cat $cmd | ssh $host -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null 2>&1
else
  if test -z $user; then
    cat $cmd | sshpass -p $password ssh $host -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null 2>&1
  else
    cat $cmd | sshpass -p $password ssh -l $user $host -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null 2>&1
  fi
fi

echo "end check host [$host]"
echo "=========================================================="
