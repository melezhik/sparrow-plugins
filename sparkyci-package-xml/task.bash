set -e
set -x

2>&1

echo "installing xml packages on sparkyci"
echo "==================================="

sudo apk add libxml2 libxml2-dev
