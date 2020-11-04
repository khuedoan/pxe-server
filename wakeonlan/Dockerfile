FROM alpine:3

RUN apk add awake curl

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
