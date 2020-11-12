#!/bin/sh

until curl -s 127.0.0.1 > /dev/null; do
  echo "HTTP server is not ready"
done

awake 00:23:24:d1:f3:f0 \
      00:23:24:d1:f4:d6 \
      00:23:24:d1:f5:69 \
      00:23:24:e7:04:60
