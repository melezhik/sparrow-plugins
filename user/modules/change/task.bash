set -e

if [[ $os == alpine ]]; then
  echo "update of existing user is not supported for $os OS"
  exit
fi


debug=$(config debug)

if [[ -n $debug ]]; then
  set -x
fi

user=$(config name)
newlogin=$(config new_login)
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
  gid=" -g $gid"
fi


current_user_id=`id $user`
old_user_home=$(grep $user /etc/passwd | cut -f 6 -d ":")

if [[ $managehome == yes ]] && [[ -n $homedir ]]; then
    new_user_home=$homedir
    homedir_args="-m -d $homedir"
elif [[ $managehome == no ]] || [[ ! -n $homedir ]]; then
  echo "Don't change user home as managehome set to 'no' OR homedir not set"
  new_user_home=$old_user_home
else
  echo "Managehome should be (yes/no)"
  exit 2
fi


if [[ -n $groups ]] ; then
  groups=" -G $groups"
fi

if [[ -n $newlogin ]]; then
  new_login=" -l $newlogin"
fi


if [[ -n $new_login ]]    || \
   [[ -n $uid ]]          || \
   [[ -n $gid ]]          || \
   [[ -n $homedir_args ]] || \
   [[ -n $groups ]]; then
   usermod $new_login $uid $gid $homedir_args $groups $name
fi 

if [[ -n $password ]]; then
  echo "change user password ..."
  echo $name:$password | chpasswd
fi

# Validate user by login
if [[ -n $newlogin ]]; then
  new_user_id=$(id $newlogin)
else 
  new_user_id=$(id $user)
fi

# echo current_user_id : $current_user_id 
# echo new_user_id : $new_user_id
# echo old_user_home : $old_user_home
# echo new_user_home : $new_user_home

if [[ ! "$current_user_id" == "$new_user_id" ]] || [[ ! $old_user_home == $new_user_home ]] ; then
  echo "user $user changed"
else
  echo "user $user - nothing changed"
fi

echo $new_user_id
