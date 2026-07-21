# Use PHP with an Apache web server
FROM php:8.2-apache

# Install MySQL extensions for PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy the PHP files from this folder into the web server
COPY . /var/www/html/

EXPOSE 80
