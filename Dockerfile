# build RedisJSON with rust
FROM rust AS builder

RUN apt clean && apt -y update && apt -y install --no-install-recommends \
    clang && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/RedisJSON/RedisJSON.git
WORKDIR RedisJSON

RUN cargo build --release

# run module in official redis
FROM redis
WORKDIR /data

RUN mkdir -p /usr/lib/redis/modules
COPY --from=builder /RedisJSON/target/release/librejson.so /usr/lib/redis/modules

EXPOSE 6379
CMD ["redis-server", \
     "--loadmodule", "/usr/lib/redis/modules/librejson.so"]
