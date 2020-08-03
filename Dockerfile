FROM ubuntu:latest
FROM php:5.6-apache

RUN apt-get update

RUN docker-php-ext-install mysqli && a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./config/000-default.conf /etc/apache2/sites-enabled/

COPY ./config/php.ini /usr/local/etc/php/

RUN apt-get install nano

RUN apt-get install git zip -y