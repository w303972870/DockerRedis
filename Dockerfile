FROM alpine:latest
MAINTAINER Eric Wang <wdc-zhy@163.com>

ENV START=redis LISTION=IP SENTINEL_LISTION_SERVER_NAME=master SENTINEL_LISTION_SERVER_IP=master \
    SENTINEL_LISTION_SERVER_IP_PORT=6379 SENTINEL_QUORUM=2 SENTINEL_DOWN_AFTER=1000 \
    SENTINEL_FAILOVER=1000 REDIS_PORT=6370 REDIS_REQUIREPASS=0 REDIS_MASTERAUTH=0 \
    REDIS_SLAVEOF_IP=0  REDIS_SLAVEOF_PORT=0 REDIS_BIND_IP=0.0.0.0 PROTECTED_MODE=no

RUN apk update && apk add redis

RUN mkdir -p /data/redis/logs
WORKDIR /data/redis

ADD sentinel.conf .
ADD docker-entrypoint.sh /usr/local/bin/

RUN chown redis:redis /data/redis/* && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 26379

ENTRYPOINT ["docker-entrypoint.sh"]
