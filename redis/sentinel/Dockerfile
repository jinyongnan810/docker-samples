FROM redis:alpine

EXPOSE 26379
ADD sentinel.conf /etc/redis/sentinel.conf
RUN chown redis:redis /etc/redis/sentinel.conf
RUN chmod 777 /etc/redis/sentinel.conf
RUN chown redis:redis /etc/redis
RUN chmod 777 /etc/redis
# ENV SENTINEL_QUORUM 1
# ENV SENTINEL_DOWN_AFTER 100
# ENV SENTINEL_FAILOVER 100
COPY sentinel-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/sentinel-entrypoint.sh
ENTRYPOINT ["sentinel-entrypoint.sh"]
