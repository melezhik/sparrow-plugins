set -e

cd /etc/containers/systemd

app=$(config name)

version=$(config version)

echo "deploy $app version $version"

echo "deploy directory: ", pwd

ln -sf $app@.container $app@$version
