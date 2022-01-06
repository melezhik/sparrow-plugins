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

su --shell `type -P bash` --login -c "${root_dir}/install.bash $distro $url $token $agent" $user

echo "{ 'dir' : '/home/$user/.agents/$agent', 'command' : './run.sh'  } " > $cache_root_dir/state.json
