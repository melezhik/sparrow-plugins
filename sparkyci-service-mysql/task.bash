set -e
set -x

echo "installing mysql service on sparky"
echo "=================================="

sudo apk add mysql mysql-client
sudo mysql_install_db --user=mysql --datadir=/var/lib/mysql
sudo bash -c "nohup /usr/bin/mysqld_safe &"
sudo bash -c "echo select 1 | mysql"

