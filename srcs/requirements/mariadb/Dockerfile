FROM       debian:oldstable
RUN        apt update && apt upgrade && apt install -y mariadb-server
COPY       conf/50-server.cnf /etc/mysql/mariadb.conf.d
# COPY       tools/init.sql /etc/mysql/init.sql
COPY       tools/script.sh .
EXPOSE     3306

CMD        ["./script.sh"]