#!/bin/sh
php artisan config:cache
php artisan config:clear
php artisan nova:publish
# npm run build-nova-components-prod
php artisan migrate --force
php artisan route:cache
php artisan route:clear
php artisan scribe:generate --verbose
# php artisan db:seed --class=GameStringsTableSeeder
# php artisan db:seed --class=GameParametersTableSeeder
# php artisan db:seed --class=GameRulesTableSeeder

sed -i "s,LISTEN_PORT,$PORT,g" /etc/nginx/nginx.conf

php-fpm -D

status_php_fpm=$?
if [ $status_php_fpm -ne 0 ]; then
  echo "php-fpm Failed: $status_php_fpm"
  exit $status_php_fpm
  else echo "Starting PHP-FPM: OK"
fi

# while ! nc -w 1 -z 127.0.0.1 9000; do sleep 0.1; done;

nginx

status_nginx=$?
if [ $status_nginx -ne 0 ]; then
  echo "NGINX Failed: $status_nginx"
  exit $status_nginx
  else echo "Starting NGINX: OK"
fi