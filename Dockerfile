# Utiliser l'image officielle PHP avec les extensions nécessaires pour Laravel
FROM php:8.2.27-fpm

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Définir le répertoire de travail
WORKDIR /var/www

# Copier les fichiers Laravel du dossier src dans le conteneur
COPY src/ .

# Copier le fichier .env dans le conteneur
COPY .env .env

# Installer Node.js et npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Installer les dépendances PHP
RUN composer install --no-dev --optimize-autoloader

# Donner des permissions aux dossiers requis par Laravel
RUN mkdir -p storage bootstrap/cache && chmod -R 775 storage bootstrap/cache

# Exposer le port 9000
EXPOSE 9000

# Lancer PHP-FPM
CMD ["php-fpm"]
