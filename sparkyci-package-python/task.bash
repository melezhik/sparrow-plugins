set -e
set -x

2>&1

echo "installing python3/pip/py3-pytest packages"
echo "=========================================="

sudo apk add python3 py3-pip python3-dev py3-pytest

