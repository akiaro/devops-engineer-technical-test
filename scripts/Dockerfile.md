FROM php:8.2-fpm

RUN apt-get update \
 && apt-get install -y nginx supervisor \
 && docker-php-ext-install mysqli pdo pdo_mysql

COPY index.php /var/www/html/
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
CMD ["/usr/bin/supervisord"]
