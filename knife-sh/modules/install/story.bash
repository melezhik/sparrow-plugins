debug=$(config debug)

[[ $debug ]] && set -x

install_path=$( config install_path )

echo "Installing knife-sh from https://github.com/vadv/knife-sh"
GOPATH=/tmp/gopath go get -u github.com/vadv/knife-sh
install /tmp/gopath/bin/knife-sh "${install_path}/knife-sh"

"${install_path}/knife-sh" --help
if [[ $? == 1 ]]; then
  exit 0
fi
