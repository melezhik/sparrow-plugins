package=$(story_var package)

echo trying to install $package ...
echo os - $os
echo installer - yum 

if yum -q list installed $package 2>/dev/null ; then
  :
else
  yum makecache fast
  yum -y -q install $package || exit 1
  yum -q list installed $package || exit 1 
fi


