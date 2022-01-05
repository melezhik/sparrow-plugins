set -e

distro=$(config distro)
url=$(config url)
token=$(config token)
agent=$(config agent)
workdir=~/.agents

if test -z $agent; then
  echo "agent parameter is required"
  exit 1
fi

mkdir -p $workdir/$agent

cd $workdir/$agent

mkdir $agent


if test -f ./config.sh
  echo "seems agent is already installed, trying to remove it first ..."
  ./config.sh remove  --auth pat --token $token
fi

rm -rf *.tar.gz
wget $distro
tar xzf *.tar.gz

echo "./config.sh --acceptTeeEula --unattended --url $url --auth pat --token **** --agent $agent --runAsService"

./config.sh \
--acceptTeeEula \
--unattended \
--url $url \
--auth pat \
--token $token \
--agent $agent \
--runAsService \

sudo ./svc.sh install $USER

sudo ./svc.sh start $USER

sudo ./svc.sh status $USER

