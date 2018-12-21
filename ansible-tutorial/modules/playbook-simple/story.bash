#!bash

set -e

cd $story_dir/ansible

echo playbook is a sequence of tasks
echo we can also have a playbook header
echo where could define connection settings
echo the most simple cookbook looks like that:

tree

echo playbook.yaml:
echo ======================================
cat playbook.yaml
echo ======================================

set -x
ansible-playbook playbook.yaml
