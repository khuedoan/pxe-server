FROM centos:8

RUN dnf install -y dhcp-server

ADD dhcpd.conf /etc/dhcp/dhcpd.conf

CMD [ "dhcpd", "-f", "-cf", "/etc/dhcp/dhcpd.conf" ]
