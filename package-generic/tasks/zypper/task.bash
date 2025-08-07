package=$(task_var package)

echo trying to install $package ...
echo os - $os
echo installer - zypper

zypper install -y $package

