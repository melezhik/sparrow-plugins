set -e

echo "rootless: " $(config rootless)

app=$(config name)

version=$(config version)

echo "app: $app"

echo "version: $version"

if [[ $(config rootless) = "True" ]]; then
  base_dir=~/.config/containers/systemd/
else
  base_dir=/etc/containers/systemd
fi

echo "base dir: $base_dir"

cd $base_dir

echo "deploy $app version $version"

echo "deploy directory: $base_dir"

cur=$(readlink $app@.container) || :

echo "current version: $cur"

ln -sf $app@.container $app@$version

if [[  $cur = "$base_dir/$app@$version" ]]; then
  echo "changed: false"
else
  echo "changed: true"
fi
