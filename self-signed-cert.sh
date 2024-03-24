#!/usr/bin/env bash

### change me ###
CN=common.name.crt
ALIASES="alias1.name.crt alias2.name.crt"
IP=1.2.3.4
#################

FILE_NAME=self-signed-cert

SANVAL="DNS:${CN},IP:${IP}"
for item in $ALIASES
do
  SANVAL="${SANVAL},DNS:${item}"
done

openssl req -new -x509 -days 3650 \
  -out ${FILE_NAME}.crt \
  -newkey rsa:2048 -noenc -keyout ${FILE_NAME}.key \
  -subj "/CN=${CN}" \
  -addext "subjectAltName=${SANVAL}"

openssl x509 -in ${FILE_NAME}.crt -text

