FROM alpine:3

RUN apk add tftp-hpa gettext

COPY grub.cfg /var/lib/tftpboot/grub.cfg

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "in.tftpd", "--foreground", "--secure", "/var/lib/tftpboot" ]
