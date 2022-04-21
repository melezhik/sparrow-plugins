set -e
set -x

2>&1

echo "installing zeromq packages on sparkyci"
echo "======================================"

sudo apk add zeromq-dev
