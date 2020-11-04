#!/bin/sh

until curl -s 127.0.0.1 > /dev/null; do
  echo "HTTP server is not ready"
done

awake $MAC_ADDRESSES
