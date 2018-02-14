#!/bin/bash

set -e;

subj=$(config subj)
days=$(config days)

set -x

openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days $days \
-nodes -subj $subj \
-extensions ext -config ssl.conf

openssl pkcs12 -passout pass: -inkey key.pem -in cert.pem -export -out cert.pfx


