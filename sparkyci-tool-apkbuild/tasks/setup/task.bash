set -e

pub_key=$1
prv_key=$2

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


if [[ -n $pub_key  ]] && [[ -n $prv_key ]]; then
  echo "setup public and private key"

  echo "private key path: /home/builder/.abuild/builder-62c0a309.rsa"
  echo $prv_key > /home/builder/.abuild/builder-62c0a309.rsa
  chown -R builder /home/builder/.abuild/builder-62c0a309.rsa

  echo "public key path: /home/builder/.abuild/builder-62c0a309.rsa.pub"
  echo $pub_key > /home/builder/.abuild/builder-62c0a309.rsa.pub
  chown -R builder /home/builder/.abuild/builder-62c0a309.rsa.pub

  echo PACKAGER_PRIVKEY="/home/builder/.abuild/builder-62c0a309.rsa" > /home/builder/.abuild/abuild.conf

  chown -R builder /home/builder/.abuild/abuild.conf

else

  su - builder -c "abuild-keygen -a -i"

fi

