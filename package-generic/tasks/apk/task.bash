package=$(task_var package)
set -e
echo trying to install $package ...
echo installer - apk
apk add --wait 120 $package
apk version $package
apk info -e $package

