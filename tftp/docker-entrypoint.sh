#!/bin/sh

set -e

echo "$(envsubst < /var/lib/tftpboot/grub.cfg)" > /var/lib/tftpboot/grub.cfg
cat /var/lib/tftpboot/grub.cfg

exec "$@"
