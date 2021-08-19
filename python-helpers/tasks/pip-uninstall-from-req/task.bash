#!bash

set -e

pip_options=$(config pip_options)
req_path=$(config req_path)

echo "run tasks/pip-uninstall-from-req"

set -x

pip3 uninstall -y $pip_options -r $req_path

