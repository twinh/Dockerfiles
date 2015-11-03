FROM redis:3.0

ADD redis.conf /etc/redis.conf

EXPOSE 6379
VOLUME ["/data"]

WORKDIR /data

CMD [ "redis-server", "/etc/redis.conf"]