FROM    debian:oldstable
RUN     apt-get update && apt upgrade -y && apt install -y php-fpm php-mysqli curl
COPY    conf/www.conf /etc/php/8.2/fpm/pool.d/
COPY    tools/script.sh .
RUN     chmod +x script.sh
CMD     ["./script.sh"]

# docker run -it debian:oldstable bash
# cat /etc/debian_version
# cat /etc/os-release