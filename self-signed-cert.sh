#!/usr/bin/env bash

FILE_NAME=self-signed-cert

CN=common.name.crt
SANVAL="DNS:${CN},IP:1.2.3.4"

openssl req -new -x509 -days 3650 \
  -out ${FILE_NAME}.crt \
  -newkey rsa:2048 -noenc -keyout ${FILE_NAME}.key \
  -subj "/CN=${CN}" \
  -addext "subjectAltName=${SANVAL}"

openssl x509 -in ${FILE_NAME}.crt -text

