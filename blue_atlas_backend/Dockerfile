FROM php:8.1-apache

# Instalar extensiones
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    zip \
    curl \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd intl pdo pdo_mysql zip opcache xml

# Instalar Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copiar proyecto
WORKDIR /var/www/html
COPY . .

# Asignar permisos a Laravel
RUN chown -R www-data:www-data storage bootstrap/cache

# Puerto HTTP
EXPOSE 80

CMD ["apache2-foreground"]
