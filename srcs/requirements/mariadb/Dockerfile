FROM debian:bookworm

RUN apt update -y && apt upgrade -y && \
    apt install -y mariadb-server

# -- copy files into container
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh
CMD ["/usr/local/bin/init.sh"]