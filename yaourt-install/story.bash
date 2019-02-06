debug=$(config debug)

if [[ $debug ]]; then
  set -x
fi

pacman -Sy --noconfirm --needed base-devel yajl git
declare -a packages=( package-query yaourt )

rm -rf  /tmp/aur-build
install -d -m 777 /tmp/aur-build
cd /tmp/aur-build

for package in ${packages[@]}; do

  su nobody -s /bin/bash -c "git clone https://aur.archlinux.org/$package.git"
  cd $package
  su nobody -s /bin/bash -c "makepkg --noconfirm -s"
  pacman -U --noconfirm ./*.pkg.tar.xz
  cd ..
done
