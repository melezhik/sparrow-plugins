set -e

db_user=$(config db_user)
db_pass=$(config db_pass)
db_name=$(config db_name)

set -x

2>&1

echo "installing postgresql service on sparky"
echo "======================================="


sudo apk add postgresql

sudo mkdir -p /run/postgresql

sudo chown postgres:postgres /run/postgresql

sudo rm -rf /var/lib/postgresql/data

sudo mkdir -p /var/lib/postgresql/data

sudo chown postgres:postgres /var/lib/postgresql/data

sudo chmod 0700 /var/lib/postgresql/data

sudo -u postgres sh -c -l 'initdb -D /var/lib/postgresql/data'

sudo -u postgres sh -c -l 'postgres -D /var/lib/postgresql/data >/var/lib/postgresql/logfile 2>&1 &'

sleep 5

sudo -u postgres psql -c "create user $db_user with password '$db_pass'"
sudo -u postgres sh -l -c "createdb $db_name"
sudo -u postgres psql -c "grant all privileges on database $db_name to $db_user;"

export PGPASSWORD=$db_pass

psql -d $db_name -U $db_user -c "create table foo(a text)" -h localhost

