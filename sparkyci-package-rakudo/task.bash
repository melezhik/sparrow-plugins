set -e

rakudo_version=$(config version)
glibc_url=$(config glibc_url)

set -x

echo "installing rakudo packages on sparky"
echo "===================================="

sudo apk add wget zstd curl

curl -fskL $glibc_url -o $cache_dir/glibc.apk

sudo apk add --allow-untrusted $cache_dir/glibc.apk

sudo mkdir -p /data/whateverable/

cd /data/whateverable/ && sudo curl -fsLk  https://whateverable.6lang.org/$rakudo_version \
-o $rakudo_version -D $cache_dir/headers.txt

sha=$(raku -e 'print $_ for lines().map({/"X-Full-Commit:"\s+(\S+)/; $0}).grep({$_})'  \
< $cache_dir/headers.txt )

echo "sha found: $sha"

if test $sha != $rakudo_version; then
  sudo mv -v $rakudo_version $sha
fi

sudo zstd -dqc -- $sha | sudo tar -x --absolute-names

/tmp/whateverable/rakudo-moar/$sha/bin/raku --version

echo "export RAKUBIN=/tmp/whateverable/rakudo-moar/$sha/bin/raku" >> ~/.profile

