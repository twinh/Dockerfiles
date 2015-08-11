# https://github.com/slafs/sentry-docker
# https://github.com/Turistforeningen/sentry/blob/master/Dockerfile

FROM python:2.7

RUN groupadd user && useradd --create-home --home-dir /home/user -g user user
WORKDIR /home/user

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y libxslt1-dev libxml2-dev

RUN pip install -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com -U sentry[mysql]

ADD sentry.conf.py /root/.sentry/sentry.conf.py

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /wheels/*

USER user
EXPOSE 9001

CMD sentry start && sentry celery worker -B
