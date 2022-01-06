set -e

action=$1
agent=$2
token=$3
distro=$4
url=$5

workdir=~/.agents

if test -z $action; then
  echo "action parameter is required"
  exit 1
fi

if test -z $agent; then
  echo "agent parameter is required"
  exit 1
fi

mkdir -p $workdir/$agent

cd $workdir/$agent

if test -f config.sh; then
  echo "seems agent is already installed, trying to remove it first ..."
  set +e
  ./config.sh remove  --auth pat --token $token
  set -e
fi

if test $action = "uninstall"; then
  echo "action = uninstall, exiting"
  exit
fi

rm -rf *.tar.gz
wget -q $distro
tar xzf *.tar.gz

echo "./config.sh --acceptTeeEula --unattended --url $url --auth pat --token **** --agent $agent"

./config.sh \
--acceptTeeEula \
--unattended \
--url $url \
--auth pat \
--token $token \
--agent $agent \
