FROM php:7.2-apache

RUN apt update \
 && docker-php-ext-install pdo_mysql mysqli mbstring

WORKDIR /var/www/html

EXPOSE 80