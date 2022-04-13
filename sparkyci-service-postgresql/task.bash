set -e

db_user=$(config db_user)
db_pass=$(config db_pass)
db_name=$(config db_name)

set -x

2>&1

echo "installing postgresql service on sparky"
echo "======================================="

sudo apk add postgresql

mkdir /var/lib/postgresql/data
chown postgres:postgres /run/postgresql/data
chmod 0700 /var/lib/postgresql/data

sh -l -c 'initdb -D /var/lib/postgresql/data'

su - postgres sh -l -c 'pg_ctl start -D /var/lib/postgresql/data'

sleep 5

su - postgres sh -l -c 'createuser $db_user with password "$db_pass" '
su - postgres sh -l -c 'createdb $db_name'
su - postgres sh -l -c 'psql -c "grant all privileges on database $db_name to $db_user"'

export PGPASSWORD=$db_pass

psql -d $db_name -U $db_user -c 'create table foo(a text)' -h localhost
