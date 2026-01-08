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
    mariadb-client \
    git \
    composer

# WORKDIR /var/www

RUN cd /var/www && git clone https://github.com/SirkoVZ/volkszaehler.org.git volkszaehler

WORKDIR /var/www/volkszaehler

# 1. Dev-Abhängigkeiten komplett entfernen
RUN composer remove \
    php-pm/php-pm \
    php-pm/httpkernel-adapter \
    phpunit/phpunit \
    --no-update || true \
 && sed -i '/"php-pm\/php-pm"/d' composer.json \
 && sed -i '/"php-pm\/httpkernel-adapter"/d' composer.json \
 && sed -i '/"phpunit\/phpunit"/d' composer.json
 
# Jetzt saubere Runtime-Dependencies installieren
RUN composer install \
    --no-dev \
    --no-interaction \
    --no-progress \
    --optimize-autoloader

# ──────────────────────────────────────────────────────────────
# Apache-Konfiguration erstellen
# ──────────────────────────────────────────────────────────────
# Apache Rewrite aktivieren
RUN sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/' /etc/apache2/httpd.conf

RUN printf '%s\n' \
   '<VirtualHost *:80>' \
   '    DocumentRoot "/var/www/volkszaehler/htdocs"' \
   '    <Directory "/var/www/volkszaehler/htdocs">' \
   '        AllowOverride All' \
   '        Require all granted' \
   '    </Directory>' \
   '    ErrorLog /var/log/apache2/error.log' \
   '    CustomLog /var/log/apache2/access.log combined' \
   '</VirtualHost>' \
   > /etc/apache2/conf.d/000-default.conf

# Rechte sicherstellen
RUN chown -R root:root /var/www/volkszaehler
COPY rootfs /
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
