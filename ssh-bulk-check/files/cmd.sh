echo '==='

ls -d /var/data && echo "/var/data is a directory"

echo '==='

echo "check /tmp/ dir size"
  sudo du -sh /tmp/
echo "end check"


echo '==='

echo "check if nginx is alive"
  ps uax| grep nginx| grep -v grep
echo "end check"

echo '==='
