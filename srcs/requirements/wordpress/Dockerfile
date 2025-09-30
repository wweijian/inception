FROM    debian:oldstable
RUN     apt-get update && apt upgrade -y && apt install -y php-fpm php-mysqli curl mariadb-client
COPY    conf/www.conf /etc/php/8.2/fpm/pool.d/
COPY    conf/wp-config.php /var/www/html/wp-config.php
COPY    tools/script.sh .
RUN     chmod +x script.sh
CMD     ["./script.sh"]

