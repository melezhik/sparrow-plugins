#!bash

set -e

admin=$(config admin)
password=$(config password)
cluster=$(config cluster)
ambari_host=$(config ambari_host)

set -x

curl -s -f -u $admin:$password https://$ambari_host:443/api/v1/clusters/$cluster/hosts/$host > $output

