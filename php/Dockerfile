FROM php:5.6-fpm

# Install env
ADD sources.list    /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        git \
        libgearman-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        libxml2-dev \
        libgmp-dev \
        zip \
        && rm -r /var/lib/apt/lists/*

# Install PHP extensions
COPY memcached.tgz /home/memcached.tgz
COPY gearman.tgz /home/gearman.tgz
COPY redis.tgz /home/redis.tgz
COPY msgpack.tgz /home/msgpack.tgz
COPY xdebug.tgz /home/xdebug.tgz
COPY memcache.tgz /home/memcache.tgz
COPY xhprof.tgz /home/xhprof.tgz

RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-freetype-dir=/usr/include/freetype2 \
        --with-png-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
        && docker-php-ext-install gd \
        && docker-php-ext-install zip \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install mcrypt \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install mysql \
        && docker-php-ext-install soap \
        && docker-php-ext-install bcmath \
        && docker-php-ext-install gmp
RUN pecl install /home/memcached.tgz && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini \
        && pecl install /home/gearman.tgz && echo "extension=gearman.so" > /usr/local/etc/php/conf.d/gearman.ini \
        && pecl install /home/redis.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
        && pecl install /home/msgpack.tgz && echo "extension=msgpack.so" > /usr/local/etc/php/conf.d/msgpack.ini \
        && pecl install /home/memcache.tgz && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/memcache.ini \
        && pecl install /home/xhprof.tgz && echo "extension=xhprof.so" > /usr/local/etc/php/conf.d/xhprof.ini \
        && pecl install /home/xdebug.tgz && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini

# PHP config
ADD php.ini    /usr/local/etc/php/php.ini
ADD php-fpm.conf    /usr/local/etc/php-fpm.conf

# Composer
ADD composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer

# PHPUnit
ADD phpunit.phar /usr/local/bin/phpunit
RUN chmod 755 /usr/local/bin/phpunit

WORKDIR /data

# Write Permission
RUN usermod -u 1000 www-data

EXPOSE 9000
VOLUME ["/data"]
