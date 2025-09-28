#!/bin/bash

INIT='/tmp/init.sql'

echo "USE mysql;" > ${INIT}
echo "FLUSH PRIVILEGES;" >> ${INIT}
echo "DELETE FROM mysql.user WHERE User='';" >> ${INIT}
echo "DROP DATABASE IF EXISTS test;" >> ${INIT}
echo "DELETE FROM mysql.db WHERE Db='test';" >> ${INIT}
echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" >> ${INIT}
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';" >> ${INIT}
echo "CREATE DATABASE ${WP_DB_NAME};" >> ${INIT}
echo "CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASS}';" >> ${INIT}
echo "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASS}';" >> ${INIT}
echo "FLUSH PRIVILEGES;" >> ${INIT}

cp tmp/init.sql /etc/mysql/init.sql
exec /usr/sbin/mysqld --user=mysql --console