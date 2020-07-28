#!bash

user=$(config user)

set -x
set -e

su --shell `type -P bash` --login -c "kubectl get nodes" $user


