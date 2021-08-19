#!bash

set -e

pip_options=$(config pip_options)

echo "run tasks/pip-upgrade-all"

set -x

pip3 freeze > $cache_root_dir/requirements.txt

sed -i 's/==/>=/g' $cache_root_dir/requirements.txt

pip3 install $pip_options -r $cache_root_dir/requirements.txt --upgrade

