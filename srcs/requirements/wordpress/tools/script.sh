#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root

until mysqladmin ping -h"mariadb" -u"${DB_USER}" -p"${DB_PASSWORD}" --silent; do
	sleep 3
done

./-cli.phar config create \
       --dbname=${DB_NAME} \
       --dbuser=${DB_USER} \
       --dbpass=${DB_PASSWORD} \
       --dbhost=${DB_HOST} \
       --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

php-fpm8.2 -F
