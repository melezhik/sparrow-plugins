set -e
arch=$(config arch)
set -x

apk add nginx

ln -sf  /home/builder/.abuild/*.rsa.pub /home/builder/packages/raku-packages/
cd /home/builder/packages/raku-packages/
k=$(ls -1 *.rsa.pub)
echo "public key: $k"

cat << HERE > /etc/nginx/http.d/default.conf
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /home/builder/packages/raku-packages/;
	# Everything is a 404
	location / {
	#	return 404;
		autoindex on;
	}

	# You may need this to prevent return 404 recursion.
	location = /404.html {
		internal;
	}
}
HERE

echo "start nginx server ..."

ps uax|grep nginx|grep master || nohup nginx -g "daemon off;" >~/nginx.log 2>&1 </dev/null & 

echo "nginx server started"

echo "check nginx endpoint ..."

curl 127.0.0.1/$k -f -s

curl 127.0.0.1/$arch/APKINDEX.tar.gz -o /dev/null -f -s -D -

echo "done"

