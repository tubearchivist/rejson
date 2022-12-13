#!/bin/bash
# rebuild RedisJSON image

REDIS_VER=7.0.6
REJSON_VER=v2.4.2
RUST_VER=1.65.0

if [[ $(systemctl is-active docker) != 'active' ]]; then
    echo "starting docker"
    sudo systemctl start docker
fi

sudo docker buildx build \
    --build-arg RUST_VER="$RUST_VER" \
    --build-arg REDIS_VER="$REDIS_VER" \
    --build-arg REJSON_VER="$REJSON_VER" \
    --platform linux/arm64 \
    -t bbilly1/rejson:"$REJSON_VER" \
    -t bbilly1/rejson --push .

##
exit 0
