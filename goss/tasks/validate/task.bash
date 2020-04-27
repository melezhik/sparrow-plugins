set -e

install_path=$(config install_path)
cd $cache_root_dir
$install_path/goss validate --format tap



