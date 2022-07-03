pub_key=$1
prv_key=$2
apk update
apk add curl alpine-sdk
apk add rakudo
apk add rakudo-dev
apk add sudo
adduser builder wheel
addgroup wheel
echo | adduser -G wheel builder
echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
addgroup builder abuild
mkdir -p /var/cache/distfiles
chmod a+w /var/cache/distfiles
echo $prv_key > /home/builder/.abuild/builder-62c0a309.rsa
chmod a+r /home/builder/.abuild/builder-62c0a309.rsa
echo $pub_key > /home/builder/.abuild/builder-62c0a309.rsa.pub
chmod a+r /home/builder/.abuild/builder-62c0a309.rsa.pub
echo PACKAGER_PRIVKEY="/home/builder/.abuild/builder-62c0a309.rsa" > /home/builder/.abuild/abuild.conf
chmod a+r /home/builder/.abuild/abuild.conf
