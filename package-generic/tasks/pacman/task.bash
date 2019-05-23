package=$(task_var package)
echo trying to install $package ...
echo installer - pacman

if pacman -Q -q $package 1>/dev/null ; then
  :
else
  pacman -Sy
  pacman -S --noconfirm $package || exit 1
  pacman -Q -q $package 1>/dev/null || exit 1
fi
pacman -Q -q $package 1>/dev/null && echo "ok Installed"
