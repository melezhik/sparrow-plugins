set -e
set -x

apk apk add mysql
apk add mysql-client
mysql_install_db --user=mysql --datadir=/var/lib/mysql
nohup /usr/bin/mysqld_safe &
echo select 1 | mysql

