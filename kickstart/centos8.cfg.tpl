#version=RHEL8
ignoredisk --only-use={{ DISK }}
autopart --type=lvm
# Partition clearing information
clearpart --all --initlabel --drives={{ DISK }}
# Do not use graphical install
text
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device={{ NETWORK_DEVICE }} --ipv6=auto --activate
network  --hostname={{ HOSTNAME }}
repo --name="AppStream" --baseurl=http://{{ PXE_SERVER }}/CentOS/AppStream
# Use network installation
url --url="http://{{ PXE_SERVER }}/CentOS/"
# Disable Setup Agent on first boot
firstboot --disable
# Do not configure the X Window System
skipx
# System services
services --enabled="chronyd"
# System timezone
timezone Asia/Ho_Chi_Minh --isUtc
user --groups=wheel --name={{ USERNAME }} --password={{ ENCRYPTED_PASSWORD }} --iscrypted --gecos="{{ USERNAME }}"

%packages
@^minimal-environment
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end

reboot
