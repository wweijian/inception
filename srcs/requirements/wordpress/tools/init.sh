#!/bin/bash

mkdir -p /var/www/wordpress
cd /var/www/wordpress

WP_PATH='/usr/local/bin/wp'

if [ ! -f ${WP_PATH} ]; then
	curl -O  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar ${WP_PATH}
fi

if [ ! -f wp-config.php ]; then
	wp core download --allow-root
	mv wp-config-sample.php wp-config.php
	sed -i "s|database_name_here|${DB_NAME}|" wp-config.php
	sed -i "s|username_here|${DB_USER}|" wp-config.php
	sed -i "s|password_here|${DB_PASSWORD}|" wp-config.php
	sed -i "s|localhost|mariadb|" wp-config.php
fi

sleep 15

if ! wp core is-installed --allow-root; then
	wp core install \
		--url="${DOMAIN_NAME}" \
		--title="${SITE_TITLE}" \
		--admin_user="${WP_ADMIN}" \
		--admin_email="${WP_ADMIN_EMAIL}" \
		--admin_password="${WP_ADMIN_PASSWORD}" \
		--skip-email \
		--allow-root
	wp user create \
		"${WP_USER}" "${WP_USER_EMAIL}" \
		--user_pass="${WP_USER_PASSWORD}" \
		--role=editor \
		--allow-root
fi

mkdir -p /run/php
php-fpm8.2 -F
