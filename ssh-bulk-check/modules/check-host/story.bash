#!bash

if test -z $password; then
    cat $cmd | ssh $host -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
else
  if test -z $user; then
    cat $cmd | sshpass -p $password ssh $host -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
  else
    cat $cmd | sshpass -p $password ssh -l $user $host -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
  fi
fi
