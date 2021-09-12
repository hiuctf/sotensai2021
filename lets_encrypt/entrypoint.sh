#!/bin/sh
echo "CERT_DOMAIN: $CERT_DOMAIN"
echo certbot certonly $CERT_OPTION --agree-tos --standalone --email $CERT_EMAIL --non-interactive -d $CERT_DOMAIN
certbot certonly --agree-tos --standalone --email $CERT_EMAIL --non-interactive -d $CERT_DOMAIN \
&& cd /etc/letsencrypt/live/$CERT_DOMAIN/ \
&& cat fullchain.pem privkey.pem > server.pem