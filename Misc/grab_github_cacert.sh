#!/bin/bash

CERT=$(openssl s_client -showcerts \
	-servername github.com \
	-connect github.com:443 </dev/null 2>/dev/null |
	sed -n -e '/BEGIN\ CERTIFICATE/,/END\ CERTIFICATE/ p')
printf "%s" "$CERT" | sudo tee -a /etc/ssl/certs/ca-certificates.crt
