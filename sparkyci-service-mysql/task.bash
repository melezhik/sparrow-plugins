set -e
set -x

2>&1

echo "installing mysql service on sparky"
echo "=================================="

sudo apk add mariadb-common mariadb-client mariadb
sudo mariadb-install-db --user=mysql --datadir=/var/lib/mysql
sudo bash -c "nohup /usr/bin/mariadbd-safe &"
sleep 5

sudo bash -c "echo select 1 | mysql"

sudo mariadb-admin create sparky

sudo mysql -e "CREATE USER sparky@'localhost' IDENTIFIED BY 'sparky'"

sudo mysql -e "GRANT ALL ON sparky.* TO 'sparky'@'localhost'"

mysql -usparky -psparky -e 'create table foo (a text)' sparky

mysql -usparky -psparky -e 'insert into foo (a) values("text")' sparky

mysql -usparky -psparky -e 'select * from foo' sparky
