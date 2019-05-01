echo kernel version: $(uname -r)

if test $(config repo_update) = "1"; then
  sudo apt-get update -qq
else
  echo skip apt-get update due to repo_update unset
fi

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install apt-transport-https ca-certificates

if test $(config add_gpg_key) = "1"; then
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
else
  echo skip importing gpg key due to add_gpg_key unset
fi

sudo bash -c 'echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list'

if test $(config repo_update) = "1"; then
  sudo apt-get update -qq
else
  echo skip apt-get update due to repo_update unset
fi

sudo apt-get purge lxc-docker

sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q install linux-image-extra-$(uname -r)

sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q install apparmor

sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q install docker-engine

sudo service docker start

sudo docker run hello-world


