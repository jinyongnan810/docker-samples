FROM redis:alpine

EXPOSE 6379
ADD redis.conf /usr/local/etc/redis/redis.conf
RUN chown redis:redis /usr/local/etc/redis/redis.conf
RUN chmod 777 /usr/local/etc/redis/redis.conf
RUN chown redis:redis /usr/local/etc/redis
RUN chmod 777 /usr/local/etc/redis
