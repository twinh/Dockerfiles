FROM node:0.12

RUN npm install -g cnpm gulp bower && npm cache clear

WORKDIR /data
EXPOSE 8001
VOLUME ["/data"]

CMD node /data/web/broadcast/app.js 8001
