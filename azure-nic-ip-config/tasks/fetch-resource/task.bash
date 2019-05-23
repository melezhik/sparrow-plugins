#!bash

set -e

group=$(config group)
nic_name=$(config nic_name)

set -x

az network nic ip-config list -g $group --nic-name $nic_name -o json > $output

