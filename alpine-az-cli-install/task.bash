set -e

apk add python3
apk add openssl
apk add libffi
apk add libffi
apk add gcc
apk add python3-dev
apk add musl-dev
apk add libffi-dev
apk add make
apk add openssl-dev

curl -sL https://aka.ms/InstallAzureCli > /tmp/az-cli-install.sh

echo "" > /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt

sed -e 's/_TTY=\/dev\/tty/_TTY=\/tmp\/answers.txt]' /tmp/az-cli-install.sh

bash /tmp/az-cli-install.sh


