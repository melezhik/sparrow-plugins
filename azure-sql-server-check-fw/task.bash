#!bash

set -e

group=$(config group)
name=$(config name)

set -x

az sql server firewall-rule list  -g $group -s $name -o table
