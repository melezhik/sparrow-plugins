set -e
set -x

2>&1

echo "installing xml/xslt packages on sparkyci"
echo "========================================"

sudo apk add libxml2 libxml2-dev libxslt-dev
