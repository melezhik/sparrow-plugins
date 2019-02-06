set -e
install_path=$(config install_path)
mkdir -p $install_path

if test -f $install_path/goss; then
  echo goss already installed at $install_path/goss
else
  echo install goss into $install_path ...
  curl -fsSL https://goss.rocks/install | GOSS_DST=$install_path sh
fi

$install_path/goss --version
