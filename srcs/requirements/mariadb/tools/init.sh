#!/bin/bash
set -e

# If database not initialized, initialize it
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB in safe mode
exec mysqld_safe --datadir='/var/lib/mysql'
