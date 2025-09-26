FROM    debian:oldstable
RUN     apt update && apt upgrade && apt install -y mariadb-server
COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY    tools/init.sql /etc/mysql/init.sql
COPY    tools/script.sh .
RUN     mkdir /run/mysqld && chmod +x script.sh && \
        chown -R mysql:mysql /var/lib/mysql /run/mysqld /etc/mysql
USER    mysql
CMD     ["./script.sh"]