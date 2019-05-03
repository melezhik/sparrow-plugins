package=$(task_var package)

echo trying to install $package ...
echo installer - apt-get

if dpkg -s $package 2>&1 | grep Status: | grep 'install ok installed' 1>/dev/null 2>&1; then
  dpkg -s $package | grep Package:
  dpkg -s $package | grep Version:
  dpkg -s $package | grep Status:
else
  DEBIAN_FRONTEND=noninteractive apt-get install -y -qq $package || exit 1
  dpkg -s $package | grep Package:
  dpkg -s $package | grep Version:
  dpkg -s $package | grep Status:
fi


