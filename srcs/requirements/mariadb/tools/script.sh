#!/bin/bash

set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

exec mysqld_safe --datadir='/var/lib/mysql'
