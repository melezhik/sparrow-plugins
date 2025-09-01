set -e

version=(config version)
version="moar-"$version

user=(config user)

if [[ $user = "" ]]; then
  echo "install rakudo version: $version"
  bash $task_dir/install.sh
else
  echo "install rakudo version: $version, user: $user"
  su - $user -c "bash $task_dir/install.sh"
fi
