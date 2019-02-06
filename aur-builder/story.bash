debug=$(config debug)

if [[ $debug ]]; then
  set -x
fi

declare -a packages=$( config list )
install=$( config install )
user=$( config user )
build_root_dir=$( config build_root )
output_dir=$( config output )

pacman -Sy --noconfirm --needed base-devel yajl git

install -d -m 777 $build_root_dir
cd $build_root_dir

for package in ${packages[@]}; do
  rm -rf $build_root_dir/${package}
  install -g $user -o $user -d -m 777 $build_root_dir/${package}
  su $user -s /bin/bash -c "git clone https://aur.archlinux.org/$package.git" 
  cd $build_root_dir/${package}
  su $user -s /bin/bash -c "makepkg --noconfirm -s" || exit 11
  package_name=$(find -iname "*.pkg.tar.xz" -type f)
  mkdir -p $output_dir
  mv $package_name ${output_dir}/

  if [[ $install == 'true' ]]; then
    pacman -U --noconfirm ${output_dir}/${package_name}
  fi

  cd ..
done
