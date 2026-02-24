FROM php:8.2-apache

# Install mysqli for Adminer DB connection
RUN docker-php-ext-install mysqli

# Disable conflicting MPM modules
RUN a2dismod mpm_event \
 && a2dismod mpm_worker \
 && a2enmod mpm_prefork \
 && a2enmod rewrite

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
