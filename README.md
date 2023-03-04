# RedisJSON arm64

**!**  This image is depreciated **!**  

This build script became obsolete, redis are building official `redis/redis-stack` or `redis/redis-stack-server`. Both of these images are multi-arch for arm64/amd64 and should be drop-in replacements to this build. Please switch at your earliest convenience. This repo will be archived and the image deleted from docker hub to avoid confusion.

## Old readme for posterity

Unofficial rebuild of [RedisJSON](https://github.com/RedisJSON/RedisJSON) for Docker arm64.

Multi stage build:
- Official [ReJSON](https://github.com/RedisJSON/RedisJSON) cloned from release tag.
- Into official [Rust](https://hub.docker.com/_/rust) container to build from source.
- Official [Redis](https://hub.docker.com/_/redis) container to load the module at start.

Image available at [`bbilly1/rejson`](https://hub.docker.com/r/bbilly1/rejson).
