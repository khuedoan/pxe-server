# TODO: Upgrade to CentOS 8
FROM centos:7

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum install -y epel-release

# TODO: Use nginx instead of apache
RUN yum install -y cobbler httpd tftp

RUN yum install -y pykickstart

RUN mkdir -p /usr/share/cobbler/web

VOLUME [ "/sys/fs/cgroup" ]

RUN systemctl enable cobblerd httpd tftp

ENTRYPOINT ["/usr/sbin/init"]
