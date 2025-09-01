set -e

version=$(config version)
version="moar-"$version

user=$(config user)

if [[ $user = "" ]]; then
  echo "install rakudo version: $version"
  bash $task_dir/install.sh $version
else
  echo "install rakudo version: $version, user: $user"
  cp -v $task_dir/install.sh /tmp/rakudo-install.sh
  chmod a+x /tmp/rakudo-install.sh
  su - $user -c "bash /tmp/rakudo-install.sh $version"
fi
