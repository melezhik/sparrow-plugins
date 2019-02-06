set -e
pkg=$(story_var 'pkg')
echo install $pkg
echo "gonna do this: opkg -f /etc/opkg/opkg.conf install $pkg"
opkg -f /etc/opkg/opkg.conf install $pkg
