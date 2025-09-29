FROM       debian:bookworm
RUN        apt-get update && apt-get upgrade -y && \
           apt-get install -y mariadb-server mariadb-client && \
           rm -rf /var/lib/apt/lists/*
RUN        mkdir -p /var/lib/mysql /run/mysqld && \
           chown -R mysql:mysql /var/lib/mysql /run/mysqld && \
           chmod 750 /var/lib/mysql /run/mysqld
EXPOSE     3306
COPY       tool/script.sh /usr/local/bin/init.sh
RUN        chmod +x /usr/local/bin/init.sh
ENTRYPOINT ["/usr/local/bin/init.sh"]