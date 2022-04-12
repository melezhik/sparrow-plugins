set -e
set -x

2>&1

echo "installing mysql packages on sparky"
echo "==================================="

sudo apk add mariadb-dev mariadb-common mariadb-client
