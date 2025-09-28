#!/bin/bash

# INIT='/tmp/init.sql'

service mariadb start
sleep 4

mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'%';"
mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
mysql -e "ALTER USER root@localhost IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -u root  -p"${MARIADB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown
mysqld_safe

# cp tmp/init.sql /etc/mysql/init.sql
# exec /usr/sbin/mysqld --user=mysql --console