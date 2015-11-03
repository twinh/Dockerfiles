FROM redis:3.0

ADD redis.conf /etc/redis.conf

RUN mkdir /data/redis && mkdir /data/log && mkdir /data/log/redis

EXPOSE 6379
VOLUME ["/data"]

CMD [ "redis-server", "/etc/redis.conf"]