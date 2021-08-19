#!bash

set -e

pip_options=$(config pip_options)
pip_cmd=$(config pip)
req_path=$(config req_path)

echo "run tasks/pip-install-from-req"

set -x

$pip_cmd install $pip_options -r $req_path

