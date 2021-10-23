#!/bin/bash
# rebuild RedisJSON image

sudo docker buildx build \
    --platform linux/arm64 \
    -t bbilly1/rejson:latest --push .

##
exit 0
