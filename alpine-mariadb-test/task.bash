db_user=$(config db_user)
db_pass=$(config db_pass)
db_name=$(config db_name)

sudo apk add mariadb-common mariadb-client mariadb
sudo mariadb-install-db --user=mysql --datadir=/var/lib/mysql
sudo bash -c "nohup /usr/bin/mariadbd-safe &"
sleep 5

sudo bash -c "echo select 1 | mariadb"

sudo mariadb-admin create $db_name 2>&1

sudo mariadb -e "CREATE USER $db_user@'localhost' IDENTIFIED BY '$db_pass'" 2>&1

sudo mariadb -e "GRANT ALL ON $db_name.* TO '$db_user'@'localhost'"

mariadb -u$db_user -p$db_pass -e 'create table foo (a text)' $db_name 2>&1

mariadb -u$db_user -p$db_pass -e 'insert into foo (a) values("text")' $db_name

mariadb -u$db_user -p$db_pass -e 'select * from foo' $db_name
