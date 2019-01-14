#!bash

set -e

subscription=$(config subscription)


if test -z "${subscription}"; then
  az account list -o table
else
  set -x
  az account set --subscription $subscription -o table
  az account list
fi



