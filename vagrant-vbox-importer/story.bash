debug=$(config debug)

if [[ $debug ]];then
  set -x
fi

host_ip=$(config host.ip)
host_port=$(config host.port)
host_user=$(config host.user)
host_password=$(config host.password)

vagrant_user=$(config vagrant.user)
vagrant_pass=$(config vagrant.password)
vagrant_key=$(config vagrant.public_key)
vagrant_key_file=$(config vagrant.public_key_file)
vagrant_private_key_file=$(config vagrant.private_key_file)

box_name=$(config box.name)
box_base=$(config box.base)

which sshpass &>/dev/null && sshpass_installed=yes


if [[ ! $box_base ]];then
  echo "no specified box_base"
  exit 3
fi

if [[ -z $host_ip ]]; then
  echo "No ip specified"
  exit 2
fi

if [[ $vagrant_key_file ]] && [[ $vagrant_key ]]; then
  echo "allowed only one parameter: vagrant_key_file or vagrant_key"
  exit 1
elif [[ ! $vagrant_key_file ]] && [[ ! $vagrant_key ]];then
  echo "No public key for $vagrant_user specified. You can access to vagrant box via password method only."
  password_only=yes
fi


if [[ $vagrant_key_file ]]; then 
  vagrant_key=$(cat $vagrant_key_file)
fi

if [[ $vagrant_private_key_file ]] && [[ $vagrant_key ]]; then
  ssh_check_key="-i $vagrant_private_key_file"
elif [[ ! $vagrant_private_key_file ]]; then
  echo "private key file not specified. ssh check will be using password method."
fi  

if [[ ! $sshpass_installed == yes ]] ; then 
  echo "sshpass not installed. Ignoring your pass..."
fi


if [[ $host_password ]];then
  echo $host_password > /tmp/pass.txt
  sshpass_opt='sshpass -f /tmp/pass.txt'
fi

$sshpass_opt ssh -t -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $host_user@$host_ip -p $host_port 'sudo useradd "'$vagrant_user'" -m ; sleep 1 && \
  echo ""'$vagrant_user'":"'$vagrant_pass'"" | sudo chpasswd ; \
  echo "# Vagrant user.
"'$vagrant_user'" ALL=(ALL) NOPASSWD: ALL
Defaults:"'$vagrant_user'" !requiretty" | sudo tee -a /etc/sudoers && \
  if [[ "'$password_only'" == yes ]]; then exit 0 ; fi; \
  sudo mkdir -m 700 /home/"'$vagrant_user'"/.ssh 2> /dev/null; \
  sudo chown "'$vagrant_user'" /home/"'$vagrant_user'"/.ssh ; \
  echo "'$vagrant_key'" | sudo tee /home/"'$vagrant_user'"/.ssh/authorized_keys ; \
  sudo chown "'$vagrant_user'" /home/"'$vagrant_user'"/.ssh/authorized_keys ;' &>/dev/null

rm -rf /tmp/pass.txt 2>/dev/null

ssh -o StrictHostKeyChecking=no $vagrant_user@$host_ip $ssh_check_key ' exit ' && echo "ok user added"
ssh -o StrictHostKeyChecking=no $vagrant_user@$host_ip $ssh_check_key ' sudo shutdown -h now '

sleep 15

vagrant package --base $box_base --output $box_name
