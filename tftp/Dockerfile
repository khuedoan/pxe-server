FROM centos:8

RUN dnf install -y tftp-server

CMD [ "in.tftpd", "-L", "-s", "/var/lib/tftpboot" ]
