#!/bin/bash

until curl -s wp-php:9000 > /dev/null; do
	sleep 2
done
nginx -g "daemon off;"
