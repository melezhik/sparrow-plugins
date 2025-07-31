set -e

arch=$(uname -m)
v=$(config kelp_version)
base="https://github.com/crhuber/kelp/releases/download"

if [[ $arch = "x86_64" && $os = "darwin" ]]; then
  url="$base/v$v/kelp_${v}_darwin_amd64.tar.gz"
elif [[ $arch = "x86_64" ]]; then
  url="$base/v$v/kelp_${v}_linux_amd64.tar.gz"
elif [[ $arch = "aarch64" && $os = "darwin" ]]; then
  url="$base/v$v/kelp_${v}_darwin_arm64.tar.gz"
elif [[ $arch = "aarch64" ]]; then
  url="$base/v$v/kelp_${v}_linux_arm64.tar.gz"
fi

echo "download kelp from $url to /tmp/.kelp"

rm -rf /tmp/.kelp

mkdir -p /tmp/.kelp

cd /tmp/.kelp

if [[ $os = "alpine" ]]; then
  wget -q -O distr.tar.gz $url
else
  curl -s -f -L $url -o distr.tar.gz
fi

tar -xzf distr.tar.gz

echo "copy kelp from /tmp/.kelp to /usr/local/bin/"

sudo=$(config with-sudo)

echo "sudo mode: $sudo"

if [[ "$sudo" = "True" ]]; then
  sudo cp kelp /usr/local/bin/
else
  cp kelp /usr/local/bin/
fi

kelp init

