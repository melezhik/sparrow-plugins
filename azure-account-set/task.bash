#!bash

set -e

subscription=$(config subscription)

if test -z "${subscription}"; then
  az account list -o table
else
  set -x
  echo "set subscription: ${subscription} ..."
  az account set --subscription $subscription -o table
  az account list | grep $subscription
fi



