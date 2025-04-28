db_user=$(config db_user)
db_pass=$(config db_pass)
db_name=$(config db_name)

sudo apk add mariadb-common mariadb-client mariadb
sudo mariadb-install-db --user=mysql --datadir=/var/lib/mysql && echo "mariadb initialized"
sudo bash -c "nohup /usr/bin/mariadbd-safe &"
sleep 5

echo "select_start"
sudo bash -c "echo select 1 | mariadb"
echo "select_end"

sudo mariadb-admin create $db_name 2>&1 && echo "database created"

sudo mariadb -e "CREATE USER $db_user@'localhost' IDENTIFIED BY '$db_pass'" 2>&1 && echo "user created"

sudo mariadb -e "GRANT ALL ON $db_name.* TO '$db_user'@'localhost'"

mariadb -u$db_user -p$db_pass -e 'create table foo (a text)' $db_name 2>&1 && echo "table foo created"

echo "insert_start"

pid=$$

mariadb -u$db_user -p$db_pass -e "insert into foo (a) values(\"$pid\")" $db_name

mariadb -u$db_user -p$db_pass -e "select count(*) from foo where a = \"$pid\"" $db_name

echo ""insert_end