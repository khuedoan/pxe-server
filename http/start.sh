#!/bin/sh

set -e

cd /usr/share/nginx/html/kickstart

echo "$(envsubst < centos8.ks)" > centos8.ks
cat centos8.ks

for mac in $MAC_ADDRESSES: do
    echo "$(envsubst < network/network.ks)" > network/$mac.ks
    cat network/$mac.ks
done

nginx -g "daemon off;"
