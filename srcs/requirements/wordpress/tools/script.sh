#!/bin/bash
cd /var/www/html

if [ ! -f wp-cli.phar ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
fi

if [ ! -f index.php ]; then
	./wp-cli.phar core download --allow-root
fi

until mysqladmin ping -h"mariadb" -u"${DB_USER}" -p"${DB_PASSWORD}" --silent; do
	sleep 3
done

if [ ! -f wp-config.php ]; then
	./wp-cli.phar config create \
       		--dbname=${DB_NAME} \
       		--dbuser=${DB_USER} \
       		--dbpass=${DB_PASSWORD} \
       		--dbhost=${DB_HOST} \
       		--allow-root
	./wp-cli.phar core install \
    		--url=${DOMAIN_NAME} \
    		--title="${WP_TITLE}" \
    		--admin_user=${WP_ADMIN_USER} \
    		--admin_password=${WP_ADMIN_PASSWORD} \
    		--admin_email=${WP_ADMIN_EMAIL} \
    		--allow-root
fi

php-fpm8.2 -F
