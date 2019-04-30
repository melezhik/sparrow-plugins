echo "=== ssh config check ==="
sudo ls -l /etc/ssh/sshd_config && echo OK
echo "==="

echo "=== sshd version check ==="

sudo dpkg --list|grep openssh-server

(echo -e 'protocol: '; sudo grep "^Protocol" /etc/ssh/sshd_config | sed 's/Protocol //')

echo "==="

