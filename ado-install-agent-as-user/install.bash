set -e

distro=$1
url=$2
token=$3
agent=$4
workdir=~/.agents

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

echo "spawning agnent process ..."

nohup ./run.sh > agent.log 2>&1 &

echo $! > .pid

echo "pid:"

cat .pid

