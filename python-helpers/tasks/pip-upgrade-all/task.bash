#!bash

set -e

pip_options=$(config pip_options)
pip_cmd=$(config pip)

echo "run tasks/pip-upgrade-all"

set -x

$pip_cmd freeze > $cache_root_dir/requirements.txt

sed -i 's/==/>=/g' $cache_root_dir/requirements.txt

$pip_cmd install $pip_options -r $cache_root_dir/requirements.txt --upgrade

