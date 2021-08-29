#!bash

set -e

echo "load completion ..."

curl -ks https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
-o /usr/local/etc/bash_completion.d/git-completion.bash

echo "done"

echo "source /usr/local/etc/bash_completion.d/git-completion.bash to activate the completion"
