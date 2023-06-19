#!/bin/sh

# Create the initial configuration
envsubst '${QDRANT_DOMAIN}' < /etc/nginx/conf.d/qdrant.template > /etc/nginx/conf.d/default.conf

# Start Nginx in the background
nginx -g 'daemon off;' &

# Every 6 hours, check if the configuration has changed and if so, reload Nginx
while true; do
    sleep 6h
    envsubst '${QDRANT_DOMAIN}' < /etc/nginx/conf.d/qdrant.template > /etc/nginx/conf.d/default.conf.new
    if ! cmp -s /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.new; then
        mv /etc/nginx/conf.d/default.conf.new /etc/nginx/conf.d/default.conf
        nginx -s reload
    else
        rm /etc/nginx/conf.d/default.conf.new
    fi
done
