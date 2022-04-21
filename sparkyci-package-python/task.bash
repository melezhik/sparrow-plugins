set -e
set -x

2>&1

echo "installing python3/pip packages on sparkyci"
echo "==========================================="

sudo apk add python3 py3-pip python3-dev
