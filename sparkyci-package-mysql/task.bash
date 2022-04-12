set -e
set -x

2>&1

echo "installing mysql service on sparky"
echo "=================================="

sudo apk add mysql mysql-client
sudo mysql_install_db --user=mysql --datadir=/var/lib/mysql
sudo bash -c "nohup /usr/bin/mysqld_safe &"
sleep 5

sudo bash -c "echo select 1 | mysql"

sudo mysqladmin create sparky

sudo mysql -e "CREATE USER sparky@'localhost' IDENTIFIED BY 'sparky'"

sudo mysql -e "GRANT ALL ON sparky.* TO 'sparky'@'localhost'"

mysql -usparky -psparky -e 'create table foo (a text)' sparky

mysql -usparky -psparky -e 'insert into foo (a) values("text")' sparky

mysql -usparky -psparky -e 'select * from foo' sparky
