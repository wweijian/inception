#!/bin/bash

until [ -f /var/www/html/index.php ]; do
	sleep 2
done
nginx -g "daemon off;"
