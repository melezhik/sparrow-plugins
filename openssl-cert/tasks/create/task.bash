CA=$(config CA)

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=$CA" \
    -keyout $cache_root_dir/key  -out $cache_root_dir/cert 2>/dev/null
