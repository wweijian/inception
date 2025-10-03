FROM debian:bookworm

RUN apt update -y && apt upgrade -y && \
    apt install -y curl php php-fpm php-mysql mariadb-client

# COPY conf/default.conf /etc/php/7.4/fpm/pool.d/www.conf
# COPY tools/init.sh /usr/local/bin/wordpress.sh

# RUN chmod +x /usr/local/bin/init.sh

# CMD ["/usr/local/bin/init.sh"]

# CMD ["tail", "-f", "/dev/null"]