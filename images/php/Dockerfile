FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
        vim \
        curl \
        wget \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
	libpng-dev \
	libonig-dev \
	libzip-dev \
	libmcrypt-dev \
        libxml2-dev \
        libc-client-dev \
        libkrb5-dev \
        && pecl install mcrypt-1.0.3 \
	&& docker-php-ext-enable mcrypt \
        && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql zip soap intl \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
        && docker-php-ext-install -j$(nproc) gd

RUN pecl install mongodb \
    &&  echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/mongo.ini

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install -j$(nproc) imap

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

COPY ./devinstall.sh /devinstall.sh

RUN chmod u+x /devinstall.sh && \
    /devinstall.sh

WORKDIR /var/www

CMD ["php-fpm"]
