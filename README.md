# RedisJSON arm64
Unofficial rebuild of [RedisJSON](https://github.com/RedisJSON/RedisJSON) for Docker arm64.

Multi stage build:
- Official [Rust](https://hub.docker.com/_/rust) container to build RedisJSON from source.
- Official [Redis](https://hub.docker.com/_/redis) container to load the module at start.

Image available at [`bbilly1/rejson`](https://hub.docker.com/r/bbilly1/rejson).
