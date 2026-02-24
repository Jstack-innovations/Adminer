FROM php:8.2-cli

# Install MySQL extensions (Adminer needs this)
RUN docker-php-ext-install pdo pdo_mysql mysqli

WORKDIR /app

COPY . /app

# Run PHP built-in server
CMD ["php", "-S", "0.0.0.0:3000", "adminer.php"]

EXPOSE 3000
