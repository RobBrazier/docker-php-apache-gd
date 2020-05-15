FROM php:7.4-apache

WORKDIR /var/www/html/

COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install Dependencies
RUN apt-get update && \
    apt-get install -y zlib1g-dev libfreetype6-dev libpng-dev libjpeg-dev libwebp-dev libzip-dev unzip git && \
    apt-get clean && \
# Install extensions
    docker-php-ext-install pdo_mysql zip exif pcntl sockets && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install gd && \
    a2enmod rewrite
