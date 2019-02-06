pkg=$(story_var pkg)

echo install $pkg
echo "gonna do this: opkg -f /etc/opkg/opkg.conf install $pkg"

if opkg -f /etc/opkg/opkg.conf install $pkg; then
  exit 2
else
  exit 0
fi
 
