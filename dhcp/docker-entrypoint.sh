#!/bin/sh

set -e

echo "$(envsubst < /etc/dhcp/dhcpd.conf)" > /etc/dhcp/dhcpd.conf

exec "$@"
