pub_key=$(config pub_key)
prv_key=$(config prv_key)
pkgname=$(config pkgname)

sudo bash $root_dir/setup.bash $pub_key $prv_key $pkgname

