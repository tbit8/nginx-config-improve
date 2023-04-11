FROM php:8.0.21-fpm-alpine

RUN apk add --no-cache nginx wget libzip-dev zip && docker-php-ext-install zip

RUN mkdir -p /run/nginx

COPY docker/nginx.conf /etc/nginx/nginx.conf

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN mkdir -p /app
COPY . /app
# COPY index.php /app/public

RUN sh -c "wget http://getcomposer.org/composer.phar && chmod a+x composer.phar && mv composer.phar /usr/local/bin/composer"

WORKDIR /app
 
# Make the file executable, or use "chmod 777" instead of "chmod +x"
RUN chmod +x /app/run.sh

RUN chown -R www-data: /app
# RUN chown -R www-data: /app/public

# This will run the shell file at the time when container is up-and-running successfully (and NOT at the BUILD time)
ENTRYPOINT ["/app/run.sh"]
