set -x
set -e
curl -sLf https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo
yum install mssql-tools unixODBC-devel
PATH=$PATH:/opt/mssql-tools/bin sqlcmd -?

