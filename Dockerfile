FROM php:8.2-apache

# Install MySQL support (Adminer needs this)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable rewrite (safe for PHP apps)
RUN a2enmod rewrite

# Copy project files
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
