set -e
set -x

apk add nginx

ln -fs /home/builder/.abuild/*.rsa.pub /home/builder/packages/raku-packages/key.rsa.pub

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

ps uax|grep nginx|grep master || nohup nginx -g "daemon off;" >/dev/null 2>&1 &

curl 127.0.0.1/key.rsa.pub -f -s
curl 127.0.0.1/x86_64/APKINDEX.tar.gz -o /dev/null -f -s -D -
