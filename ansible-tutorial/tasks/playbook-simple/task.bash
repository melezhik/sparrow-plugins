#!bash

set -e

cd $task_dir/ansible

echo playbook is a sequence of tasks
echo we can also have a playbook header
echo where could define connection settings
echo the most simple cookbook looks like that:

tree

echo cat playbook.yaml
echo ======================================
cat playbook.yaml
echo ======================================
echo run [ansible-playbook playbook.yaml]
echo ======================================

ansible-playbook playbook.yaml
