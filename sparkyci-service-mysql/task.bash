set -e

db_user=$(config db_user)
db_pass=$(config db_pass)
db_name=$(config db_name)

set -x

2>&1

echo "installing mysql service on sparky"
echo "=================================="

sudo apk add mariadb-common mariadb-client mariadb
sudo mariadb-install-db --user=mysql --datadir=/var/lib/mysql
sudo bash -c "nohup /usr/bin/mariadbd-safe &"
sleep 5

sudo bash -c "echo select 1 | mysql"

sudo mariadb-admin create $db_name

sudo mysql -e "CREATE USER $db_user@'localhost' IDENTIFIED BY '$db_pass'"

sudo mysql -e "GRANT ALL ON $db_name.* TO '$db_user'@'localhost'"

mysql -u$db_user -p$db_pass -e 'create table foo (a text)' $db_name

mysql -u$db_user -p$db_pass -e 'insert into foo (a) values("text")' $db_name

mysql -u$db_user -p$db_pass -e 'select * from foo' $db_name
