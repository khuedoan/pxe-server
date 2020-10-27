#!/bin/sh

set -e

envsubst < "/etc/dhcp/dhcpd.conf.template" > "/etc/dhcp/dhcpd.conf"

exec "$@"
