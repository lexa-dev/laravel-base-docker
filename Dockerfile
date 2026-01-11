FROM php:8.3-fpm-alpine

WORKDIR /var/www/app

RUN apk update && apk add --no-cache \
    bash \
    git \
    curl \
    libpng-dev \
    libxml2-dev \
    zip \
    unzip \
    icu-dev \
    icu-libs \
    oniguruma-dev \
    g++ \
    make \
    autoconf \
    npm \
    nodejs

RUN apk add --no-cache libzip-dev
RUN docker-php-ext-install pdo pdo_mysql intl mbstring bcmath opcache zip

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

USER root
RUN chmod -R 777 /var/www/app
