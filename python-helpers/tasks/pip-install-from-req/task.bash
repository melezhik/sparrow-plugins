#!bash

set -e

pip_options=$(config pip_options)
req_path=$(config req_path)

echo "run tasks/pip-install-from-req"

set -x

pip3 install $pip_options -r $req_path

