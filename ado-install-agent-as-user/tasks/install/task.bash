set -e

distro=$(config distro)
url=$(config url)
token=$(config token)
agent=$(config agent)
user=$(config user)
action=$(config action)

if test -z $agent; then
  echo "agent parameter is required"
  exit 1
fi

cp $task_dir/install.bash /home/$user/.agent-install.bash

chmod a+xr /home/$user/.agent-install.bash

su --shell `type -P bash` --login -c "/home/$user/.agent-install.bash $action $agent $token $distro $url" $user

