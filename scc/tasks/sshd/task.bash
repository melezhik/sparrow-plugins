echo $os

if test $os = "darwin"; then
  cat /etc/ssh/sshd_config
else
 sudo sshd -T
fi

