debug=$(config debug)
[[ $debug ]] && set -x
set -e

user=$(config name)
uid=$(config uid)
gid=$(config gid)
managehome=$(config managehome)
homedir=$(config home_dir)
groups=$(config groups)
password=$(config password)

if [[ -n $uid ]]; then
  uid=" -u $uid"
fi

if [[ -n $user ]]; then
  name=" $user"
else
  echo "User name required"
  exit 1
fi
if [[ -n $gid ]]; then
  if [[ $os == alpine ]]; then
    gid=" -G $gid"
  else
    gid=" -g $gid"
  fi
fi

if [[ $managehome == yes ]]; then
  if [[ $os == alpine ]]; then
    home_key=""
  else
    home_key=" -m"
  fi
elif [[ $managehome == no ]]; then
  if [[ $os == alpine ]]; then
    home_key=" -H"
  else
    home_key=" -M"
  fi
else
  echo "Managehome should be (yes/no)"
  exit 2
fi

if [[ $managehome == yes ]] && [[ -n $homedir ]]; then
  if [[ $os == alpine ]]; then
    homedir=" -h $homedir"
  else
    homedir=" -d $homedir"
  fi
fi

if [[ -n $groups ]] ; then
  groups=" -G $groups"
fi

if [[ $os == alpine ]]; then
  adduser $home_key $homedir $name $uid $gid $groups -D
else
  useradd $home_key $homedir $uid $gid $groups $name 
fi

if [[ -n $password ]]; then
  echo "set password..."
  echo $name:$password | chpasswd
fi

id $user && echo "user $user created"
