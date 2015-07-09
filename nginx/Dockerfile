FROM nginx:1.9.0

ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  sites-enabled/*    /etc/nginx/conf.d/
RUN  mkdir /data/web && mkdir /data/log && mkdir /data/log/nginx
RUN  chown -R www-data.www-data /data/web /data/log

EXPOSE 80
VOLUME ["/data"]

