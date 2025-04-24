set -e
sudo apk add python3
sudo apk add openssl
sudo apk add libffi
sudo apk add libffi
sudo apk add gcc
sudo apk add python3-dev
sudo apk add musl-dev
sudo apk add libffi-dev
sudo apk add make
sudo apk add openssl-dev

curl -sL https://aka.ms/InstallAzureCli > /tmp/az-cli-install.sh

echo "" > /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt
echo "" >> /tmp/answers.txt

perl -i -p -e 's{_TTY=/dev/tty}[_TTY=/tmp/answers.txt]' /tmp/az-cli-install.sh

bash /tmp/az-cli-install.sh


