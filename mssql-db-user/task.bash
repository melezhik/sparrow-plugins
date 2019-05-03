#!bash

db_server=$(config db_server)
db_name=$(config db_name)
db_admin=$(config db_admin)
db_pass=$(config db_pass)
db_user_pass=$(config db_user_pass)

db_user=$(config db_user)

check_conn=$(config check_connection)
drop_login=$(config drop_login)

if test $check_conn = "on"; then

  set -e
  echo "checking connection ..."
  set -x
  sqlcmd -Q "SELECT name, database_id from sys.databases" -S $db_server,1433  -U $db_admin -I -P $db_pass
  exit 0

fi

if test $drop_login = "on"; then

  echo "drop login"

  set -x
  sqlcmd -Q "DROP LOGIN [$db_user]" -S $db_server,1433  -U $db_admin -I -P $db_pass -d master
  set +x

fi

echo "create login master db ..."

set -x
sqlcmd -Q "CREATE LOGIN [$db_user] WITH PASSWORD = '$db_user_pass'" -S $db_server,1433  -U $db_admin -I -P $db_pass -d master
set +x

echo "create user master db ..."

set -x
sqlcmd -Q "CREATE USER [$db_user] FOR LOGIN [$db_user]" -S $db_server,1433  -U $db_admin -I -P $db_pass -d master
set +x

echo "create login $db_name db ..."

set -x
sqlcmd -Q "CREATE USER [$db_user] FOR LOGIN [$db_user]"  -S $db_server,1433  -U $db_admin -I -P $db_pass -d $db_name
set +x

echo "grant db_owner to user on $db_name db ..."

set -x
sqlcmd -Q "EXEC sp_addrolemember 'db_owner', [$db_user]" -S $db_server,1433  -U $db_admin -I -P $db_pass -d $db_name
set +x

#sqlcmd -Q "create table test (EmpId int)" -S $db_server,1433  -U $db_user -I -P $db_user_pass -d $db_name

echo "connection string:"
echo "Server=$db_server;Initial Catalog=$db_name;Persist Security Info=False;User ID=$db_user;Password=$db_user_pass;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"


# Taken from https://stackoverflow.com/questions/35434389/how-to-drop-a-sql-server-user-with-db-owner-privilege
# SELECT s.name FROM sys.schemas s WHERE s.principal_id = USER_ID('$db_user');
# ALTER AUTHORIZATION ON SCHEMA::db_owner TO dbo;

