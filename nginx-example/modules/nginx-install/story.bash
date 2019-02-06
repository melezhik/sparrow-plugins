sudo DEBIAN_FRONTEND=noninteractive apt-get -y install nginx >/dev/null
dpkg -s nginx | grep Status:
