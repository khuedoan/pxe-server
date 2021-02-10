#!/bin/sh

set -e

echo "$(envsubst < /var/lib/tftpboot/grub.cfg)" > /var/lib/tftpboot/grub.cfg
cat /var/lib/tftpboot/grub.cfg

cp /mnt/images/pxeboot/{initrd.img,vmlinuz} /var/lib/tftpboot
cp /mnt/EFI/BOOT/grubx64.efi /var/lib/tftpboot

in.tftpd --foreground --secure /var/lib/tftpboot
