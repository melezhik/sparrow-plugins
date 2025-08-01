set -e

echo "installing build-essential packages"
echo "==================================="

sudo=$(config sudo)

if [[ $sudo = "True"  &&  $os = "alpine "]]; then
  sudo apk add build-base libffi-dev
elif [[ $sudo = "False"  &&  $os = "alpine "]]; then
  apk add build-base libffi-dev
elif [[ $sudo = "True"  &&  $os = "ubuntu"]]; then
  sudo apt-get install -y -q build-essential
elif [[ $sudo = "False"  &&  $os = "ubuntu"]]; then
  apt-get install -y -q build-essential
elif [[ $sudo = "True"  &&  $os = "debian"]]; then
  sudo apt-get install -y -q build-essential
elif [[ $sudo = "False"  &&  $os = "debian"]]; then
  apt-get install -y -q build-essential
fi

