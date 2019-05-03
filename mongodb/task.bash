
if ! yum -q list installed mongodb-org-server; then

  curl -k -f https://repo.mongodb.org/yum/redhat/6/mongodb-org/stable/x86_64/RPMS/mongodb-org-server-3.2.7-1.el6.x86_64.rpm \
  -o /tmp/mongodb-org-server-3.2.7-1.el6.x86_64.rpm || exit 1

  rpm --force -i /tmp/mongodb-org-server-3.2.7-1.el6.x86_64.rpm  || exit 1

fi

if ! yum -q list installed mongodb-org-shell; then

  curl -k -f http://repo.mongodb.org/yum/redhat/6/mongodb-org/stable/x86_64/RPMS/mongodb-org-shell-3.2.7-1.el6.x86_64.rpm \
  -o /tmp/mongodb-org-shell-3.2.7-1.el6.x86_64.rpm || exit 1

  rpm --force -i /tmp/mongodb-org-shell-3.2.7-1.el6.x86_64.rpm || exit 1

fi

if ! yum -q list installed mongodb-org-tools; then

  curl -k -f http://repo.mongodb.org/yum/redhat/6/mongodb-org/stable/x86_64/RPMS/mongodb-org-tools-3.2.7-1.el6.x86_64.rpm \
  -o /tmp/mongodb-org-tools-3.2.7-1.el6.x86_64.rpm || exit 1

  rpm --force -i /tmp/mongodb-org-tools-3.2.7-1.el6.x86_64.rpm || exit 1

fi 

if ! yum -q list installed mongodb-org-mongos; then

  curl -k -f http://repo.mongodb.org/yum/redhat/6/mongodb-org/stable/x86_64/RPMS/mongodb-org-mongos-3.2.7-1.el6.x86_64.rpm \
  -o /tmp/mongodb-org-mongos-3.2.7-1.el6.x86_64.rpm || exit 1

  rpm --force -i /tmp/mongodb-org-mongos-3.2.7-1.el6.x86_64.rpm || exit 1

fi

if ! yum -q list installed mongodb-org; then

  curl -k -f http://repo.mongodb.org/yum/redhat/6/mongodb-org/stable/x86_64/RPMS/mongodb-org-3.2.7-1.el6.x86_64.rpm \
  -o /tmp/mongodb-org-3.2.7-1.el6.x86_64.rpm || exit 1

  rpm --force -i /tmp/mongodb-org-3.2.7-1.el6.x86_64.rpm || exit 1

fi

service mongod restart

echo ok
