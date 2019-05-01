set -e
set -x

export DEBIAN_FRONTEND=noninteractive

echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"  | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt-get update
sudo apt-get install ansible -y -qq
