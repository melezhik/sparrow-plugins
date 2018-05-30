echo | openssl s_client -servername $host -connect $host:443  2>/dev/null | openssl x509 -noout -dates
