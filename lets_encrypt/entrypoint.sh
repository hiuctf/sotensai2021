#!/bin/sh
echo "CERT_DOMAIN: $CERT_DOMAIN"
echo certbot certonly $CERT_OPTION --agree-tos --standalone --email $CERT_EMAIL --non-interactive -d $CERT_DOMAIN
LASTEXEC=$(cat /etc/letsencrypt/lastexec)
TIME_NOW=$(date +%s)
TIME_DIFF=$(expr $TIME_NOW - $LASTEXEC)
echo last exec: $LASTEXEC, time now: $TIME_NOW
if [ $TIME_DIFF -lt "86400" ] ; then
  echo certfile is not expired
else
  certbot certonly $CERT_OPTION --agree-tos --standalone --email $CERT_EMAIL --non-interactive -d $CERT_DOMAIN \
  && cd /etc/letsencrypt/live/$CERT_DOMAIN/ \
  && cat fullchain.pem privkey.pem > server.pem \
  && date +%s > ../../lastexec
fi
