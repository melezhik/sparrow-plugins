#!bash

ssh_command=$(config ssh_command)

sudo_command=$(config sudo_command)

set -e
set -x

$ssh_command $server $sudo_command

