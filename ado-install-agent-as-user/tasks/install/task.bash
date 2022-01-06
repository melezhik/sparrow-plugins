set -e

distro=$(config distro)
url=$(config url)
token=$(config token)
agent=$(config agent)
user=$(config user)

if test -z $agent; then
  echo "agent parameter is required"
  exit 1
fi

sudo cp $root_dir/install.bash /home/$user/.agent-install.bash

sudo chmod a+xr /home/$user/.agent-install.bash


su --shell `type -P bash` --login -c "/home/$user/.agent-install.bash $distro $url $token $agent" $user

