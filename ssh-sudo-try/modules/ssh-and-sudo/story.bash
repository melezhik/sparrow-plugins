#!bash

ssh_command=$(config ssh_command)

sudo_command=$(config sudo_command)

server=$(story_var server);

set -e
set -x

$ssh_command $server $sudo_command

