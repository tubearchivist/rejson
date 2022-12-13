# build RedisJSON with rust

ARG REDIS_VER
ARG REJSON_VER
ARG RUST_VER

FROM rust:${RUST_VER} AS builder

ARG REJSON_VER

RUN apt clean && apt -y update && apt -y install --no-install-recommends \
    clang && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch ${REJSON_VER} https://github.com/RedisJSON/RedisJSON.git

WORKDIR RedisJSON

COPY config .cargo/config
RUN cargo build --release

# run module in official redis
FROM redis:${REDIS_VER}
WORKDIR /data

RUN mkdir -p /usr/lib/redis/modules
COPY --from=builder /RedisJSON/target/release/librejson.so /usr/lib/redis/modules

EXPOSE 6379
CMD ["redis-server", \
     "--loadmodule", "/usr/lib/redis/modules/librejson.so"]
