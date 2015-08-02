pull:
	docker pull nginx:1.9.0
	docker pull php:5.6-fpm
	docker pull mysql:5.6
	docker pull redis:3.0
	docker pull memcached:1.4
	docker pull node:0.12

dl:
	wget https://pecl.php.net/get/gearman-1.1.2.tgz -O php/gearman.tgz
	wget https://pecl.php.net/get/redis-2.2.7.tgz -O php/redis.tgz
	wget https://pecl.php.net/get/memcached-2.2.0.tgz -O php/memcached.tgz
	wget https://pecl.php.net/get/xdebug-2.3.2.tgz -O php/xdebug.tgz
	wget https://pecl.php.net/get/msgpack-0.5.6.tgz -O php/msgpack.tgz
	wget https://pecl.php.net/get/memcache-2.2.7.tgz -O php/memcache.tgz
	wget https://pecl.php.net/get/xhprof-0.9.4.tgz -O php/xhprof.tgz
	wget https://getcomposer.org/composer.phar -O php/composer.phar
	wget https://phar.phpunit.de/phpunit.phar -O php/phpunit.phar

build:
	make build-nginx
	make build-mysql
	make build-php
	make build-node

build-nginx:
	docker build -t miaostar/nginx ./nginx

run-nginx:
	docker run -i -d -p 80:80 -v ~/data:/data -t miaostar/nginx

in-nginx:
	docker run -i -p 80:80 -v ~/data:/data -t miaostar/nginx /bin/bash

build-php:
	docker build -t miaostar/php ./php

run-php:
	docker run -i -d -p 9000:9000 -v ~/data:/data -t miaostar/php

in-php:
	docker run -i -p 9000:9000 -v ~/data:/data -t miaostar/php /bin/bash

build-mysql:
	docker build -t miaostar/mysql ./mysql

run-mysql:
	docker run -i -d -p 3306:3306 -v ~/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t miaostar/mysql

in-mysql:
	docker run -i -p 3306:3306  -v ~/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t miaostar/mysql /bin/bash

build-node:
	docker build -t miaostar/node ./node

run-node:
	docker run -i -d -p 8001:8001 -v ~/data:/data -t miaostar/node

in-node:
	docker run -i -p 8001:8001 -v ~/data:/data -t miaostar/node /bin/bash

build-elasticsearch:
	docker build -t miaostar/elasticsearch ./elasticsearch

run-elasticsearch:
	docker run -i -d -p 9200:9200 -p 9300:9300 -v ~/data/elasticsearch:/usr/share/elasticsearch/data -t miaostar/elasticsearch

in-elasticsearch:
	docker run -i -p 9200:9200 -p 9300:9300 -v ~/data/elasticsearch:/usr/share/elasticsearch/data -t miaostar/elasticsearch /bin/bash

build-gearman:
	docker build -t miaostar/gearman ./gearman

run-gearman:
	docker run -d -p 4730:4730 -v ~/data:/data -it miaostar/gearman

clean:
	docker rmi -f $(shell docker images | grep "<none>" | awk "{print \$3}")
