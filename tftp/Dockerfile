FROM alpine:3

RUN apk add tftp-hpa

CMD [ "in.tftpd", "-L", "-s", "/var/lib/tftpboot" ]
