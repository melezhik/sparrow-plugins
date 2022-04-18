set -e
set -x

2>&1

echo "installing build-essential packages on sparky"
echo "============================================="

sudo apk add g++ make
