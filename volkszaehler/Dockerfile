FROM ghcr.io/hassio-addons/base:14.0.0

ENV LANG=C.UTF-8
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apk add --no-cache \
    apache2 \
    php82 \
    php82-apache2 \
    php82-pdo \
    php82-pdo_mysql \
    php82-intl \
    php82-zip \
    php82-opcache \
    php82-session \
    git \
    mariadb-client \
    composer

WORKDIR /var/www

# Checkout der Originalquelle
RUN git clone https://github.com/volkszaehler/volkszaehler.org.git volkszaehler

WORKDIR /var/www/volkszaehler

# Composer Dependencies installieren
RUN composer install --no-dev --optimize-autoloader
# Apache config aus dem Repo übernehmen
RUN cp docker/apache.conf /etc/apache2/conf.d/000-default.conf \
 && sed -i 's#/var/www/html#/var/www/public#g' /etc/apache2/conf.d/000-default.conf

RUN mkdir -p /run/apache2 \
 && chown -R apache:apache /var/www

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
