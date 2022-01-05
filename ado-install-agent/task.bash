set -e

distro=$(config distro)
url=$(config url)
token=$(config token)
agent=$(config agent)
workdir=$(config workdir)

mkdir -p $workdir

cd $workdir

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

