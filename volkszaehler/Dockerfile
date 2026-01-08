FROM ghcr.io/hassio-addons/base:14.0.0

ENV LANG=C.UTF-8
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apk add --no-cache \
    apache2 \
    php81 \
    php81-apache2 \
    php81-pdo \
    php81-pdo_mysql \
    php81-tokenizer \
    php81-intl \
    php81-zip \
    php81-opcache \
    php81-session \
    php81-mbstring \
    php81-xml \
    php81-dom \
    git \
    mariadb-client \
    composer

WORKDIR /var/www

RUN git clone https://github.com/volkszaehler/volkszaehler.org.git volkszaehler

WORKDIR /var/www/volkszaehler

# 1. Dev-Abhängigkeiten komplett entfernen
RUN composer remove \
    php-pm/php-pm \
    phpunit/phpunit \
    --dev \
    --no-update


# Jetzt saubere Runtime-Dependencies installieren
RUN composer install \
    --no-dev \
    --no-interaction \
    --no-progress \
    --optimize-autoloader


# Apache config aus dem Repo übernehmen
RUN cp docker/apache.conf /etc/apache2/conf.d/000-default.conf \
 && sed -i 's#/var/www/html#/var/www/public#g' /etc/apache2/conf.d/000-default.conf

RUN mkdir -p /run/apache2 \
 && chown -R apache:apache /var/www

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
