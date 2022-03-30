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

if test -f config.sh; then
  echo "seems agent is already installed, trying to remove it first ..."
  set +e
  sudo ./svc.sh stop
  sudo ./svc.sh uninstall
  ./config.sh remove  --auth pat --token $token
  set -e
fi

rm -rf *.tar.gz
wget -q $distro
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

