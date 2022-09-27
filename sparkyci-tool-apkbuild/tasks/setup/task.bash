set -e

pub_key=$1
prv_key=$2
key_name=$3

apk update
apk add curl alpine-sdk
apk add rakudo
apk add rakudo-dev
apk add sudo

if id -u builder 2>/dev/null 1>/dev/null; then
  echo "user builder exists, skip creation"
else
  adduser --disabled-password -G wheel builder
fi

echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
mkdir -p /var/cache/distfiles
chmod a+w /var/cache/distfiles


if [[ -n $pub_key  ]] && [[ -n $prv_key ]] && [[ ! -f $keyname ]]; then

  echo "setup public and private key"

  echo "private key path: /home/builder/.abuild/$keyname"
  echo $prv_key > /home/builder/.abuild/$keyname
  chown -R builder /home/builder/.abuild/$keyname

  echo "public key path: /home/builder/.abuild/$keyname.pub"
  echo $pub_key > /home/builder/.abuild/$keyname.pub
  chown -R builder /home/builder/.abuild/$keyname.pub

  echo PACKAGER_PRIVKEY="/home/builder/.abuild/$keyname" > /home/builder/.abuild/abuild.conf

  chown -R builder /home/builder/.abuild/abuild.conf

else

  test -f  /home/builder/.abuild/*.rsa || su - builder -c "abuild-keygen -a -i -n"

fi

