FROM php:8.1-fpm-alpine

# Instalar herramientas y extensiones necesarias
RUN apk update && apk add --no-cache \
    bash \
    git \
    g++ \
    make \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    icu-dev \
    zip \
    unzip \
    libxml2-dev \
    curl && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql intl opcache zip xml

# Instalar Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Crear directorio de trabajo
WORKDIR /var/www

# Copiar archivos de Composer y correr instalación
COPY composer.json composer.lock ./
RUN composer install --no-dev --prefer-dist --no-scripts --no-progress --optimize-autoloader

# Copiar el resto del código fuente
COPY . .

# Asignar permisos necesarios
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Exponer el puerto usado por php-fpm
EXPOSE 9000

# Comando por defecto
CMD ["php-fpm"]
