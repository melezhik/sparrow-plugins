package=$(task_var package)
set -e
echo trying to install $package ...
echo installer - opkg
opkg install $package

