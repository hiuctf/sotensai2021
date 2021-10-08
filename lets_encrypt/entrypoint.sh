#!/bin/sh
echo "CERT_FQDN: $CERT_FQDN"
echo certbot certonly $CERT_OPTION --agree-tos --standalone --email $CERT_EMAIL --non-interactive -d $CERT_FQDN
LASTEXEC=$(cat /etc/letsencrypt/lastexec)
TIME_NOW=$(date +%s)
TIME_DIFF=$(expr $TIME_NOW - $LASTEXEC)
echo last exec: $LASTEXEC, time now: $TIME_NOW


mkdir -p /etc/letsencrypt/certfiles
chmod a+rx /etc/letsencrypt/live/$CERT_FQDN/
if [ $CERT_FQDN = "" ] ; then 
  echo "env: \$CERT_FQDN not set!"
  return 1
fi

if [ $TIME_DIFF -lt "864000" ] ; then
  echo certfile is not expired
else
  certbot certonly $CERT_OPTION --agree-tos --standalone --email $CERT_EMAIL --non-interactive -d $CERT_FQDN \
  && date +%s > lastexec \
  && cd /etc/letsencrypt/live/$CERT_FQDN/ \
  && cat fullchain.pem privkey.pem > server.pem \
  && ln -sf /etc/letsencrypt/live/$CERT_FQDN/server.pem /etc/letsencrypt/certfiles/server.pem
fi
