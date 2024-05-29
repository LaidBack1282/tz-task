#!/usr/bin/env bash

envsubst < /tmp/nginx.conf > /etc/nginx/nginx.conf
exec nginx -g 'daemon off;'