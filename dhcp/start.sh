#!/bin/sh

set -e

echo "$(envsubst < /etc/dhcp/dhcpd.conf)" > /etc/dhcp/dhcpd.conf
cat /etc/dhcp/dhcpd.conf

dhcpd -f -cf /etc/dhcp/dhcpd.conf
