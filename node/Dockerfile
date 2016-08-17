FROM node:6.4

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

RUN cnpm install -g gulp

RUN cnpm install -g bower

RUN cnpm install -g phantomjs-prebuilt

RUN cnpm install -g casperjs

RUN cnpm install -g mocha-casperjs

RUN cnpm install -g casper-chai

RUN cnpm install -g chai

RUN cnpm install -g mocha

RUN npm cache clear

WORKDIR /data

VOLUME ["/data"]
