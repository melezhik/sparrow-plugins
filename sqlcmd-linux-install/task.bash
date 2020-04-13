set -x
set -e
curl -sLf https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo
#ACCEPT_EULA=Y
yum install mssql-tools unixODBC-devel -y
PATH=$PATH:/opt/mssql-tools/bin sqlcmd -?

